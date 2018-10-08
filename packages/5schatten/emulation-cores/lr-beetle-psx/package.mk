# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="lr-beetle-psx"
PKG_VERSION="528036a"
PKG_SHA256="fc556e263e08d5a63800a0f120e26bb408085437330c16268666d2c86c536e53"
PKG_ARCH="any"
PKG_LICENSE="GPLv2"
PKG_SITE="https://github.com/libretro/beetle-psx-libretro"
PKG_URL="https://github.com/libretro/beetle-psx-libretro/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain retroarch"
PKG_SECTION="emulation"
PKG_LONGDESC="Standalone port/fork of Mednafen PSX to the Libretro API."

PKG_LIBNAME="mednafen_psx_libretro.so"
PKG_LIBPATH="$PKG_LIBNAME"

pre_build_target() {
  export GIT_VERSION=$PKG_VERSION
}

make_target() {
  make

  if [ "$PROJECT" == "Generic" ];then
    mkdir -p tmp
    mv $PKG_LIBNAME tmp/
    make clean
    make HAVE_HW=1
    mv tmp/$PKG_LIBNAME .
  fi
}

makeinstall_target() {
    mkdir -p $INSTALL/usr/lib/libretro
    cp mednafen_psx_*libretro.so $INSTALL/usr/lib/libretro/
}
