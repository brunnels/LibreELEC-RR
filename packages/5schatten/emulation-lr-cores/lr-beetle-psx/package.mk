# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="lr-beetle-psx"
PKG_VERSION="a081f34a52d6e7fde7063d62d54a60ea05bf42fc"
PKG_SHA256="129767f833f7557edeeea44a99d2b5d7ee6fa93c3c9b769ed0898cb3918a2a4a"
PKG_LICENSE="GPLv2"
PKG_SITE="https://github.com/libretro/beetle-psx-libretro"
PKG_URL="https://github.com/libretro/beetle-psx-libretro/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain retroarch"
PKG_LONGDESC="Standalone port/fork of Mednafen PSX to the Libretro API."

PKG_LIBNAME="mednafen_psx_libretro.so"
PKG_LIBPATH="$PKG_LIBNAME"

make_target() {
  make GIT_VERSION=${PKG_VERSION:0:7}

  if [ "$PROJECT" = "Generic" ];then
    mkdir -p tmp
    mv $PKG_LIBNAME tmp/
    make clean
    make HAVE_HW=1 GIT_VERSION=${PKG_VERSION:0:7}
    mv tmp/$PKG_LIBNAME .
  fi
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/lib/libretro
  cp mednafen_psx_*libretro.so $INSTALL/usr/lib/libretro/
}
