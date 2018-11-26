# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="lr-beetle-psx"
PKG_VERSION="8d15a7823c887fb46db43b59c0f11b1fb35905f6"
PKG_SHA256="4be9887d0a1f31271fe3423cae252d5ffbce81325f2d588d6ea555eb5d1134b1"
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
