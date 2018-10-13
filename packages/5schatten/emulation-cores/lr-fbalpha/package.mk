# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="lr-fbalpha"
PKG_VERSION="54aaac3"
PKG_SHA256="a42df03beb0f48959a6ac7866c5c377581d6b7b668e90c4eb917989aaad68513"
PKG_ARCH="any"
PKG_LICENSE="GPLv3"
PKG_SITE="https://github.com/libretro/fbalpha"
PKG_URL="https://github.com/libretro/fbalpha/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain retroarch"
PKG_SECTION="emulation"
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
