# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="lr-fbalpha"
PKG_VERSION="92ab7c60accfb6fe4f483bc1eaa0f7e7ed87ea22"
PKG_SHA256="0d1547f029b1d47895d8efbb4692a9923a8c0932e8b045869cafa853b97d1850"
PKG_LICENSE="GPLv3"
PKG_SITE="https://github.com/libretro/fbalpha"
PKG_URL="https://github.com/libretro/fbalpha/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain retroarch"
PKG_LONGDESC="Port of Final Burn Alpha to Libretro (v0.2.97.43)."
PKG_TOOLCHAIN="manual"

PKG_LIBNAME="fbalpha_libretro.so"
PKG_LIBPATH="$PKG_LIBNAME"

make_target() {
  if [ "$PROJECT" = "Amlogic" ]; then
    make -f makefile.libretro platform=rpi3 CC=$CC CXX=$CXX GIT_VERSION=$PKG_VERSION

  elif [ "$PROJECT" = "RPi" ]; then
    case $DEVICE in
      RPi)
        make -f makefile.libretro platform=armv CC=$CC CXX=$CXX GIT_VERSION=$PKG_VERSION
        ;;
      RPi2)
        make -f makefile.libretro platform=rpi2 CC=$CC CXX=$CXX GIT_VERSION=$PKG_VERSION
        ;;
    esac

  else
    make -f makefile.libretro CC=$CC CXX=$CXX GIT_VERSION=$PKG_VERSION
  fi
}

makeinstall_target() {
    mkdir -p $INSTALL/usr/lib/libretro
    cp $PKG_LIBPATH $INSTALL/usr/lib/libretro/
}
