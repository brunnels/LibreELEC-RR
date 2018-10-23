# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="lr-desmume"
PKG_VERSION="07162f4"
PKG_SHA256="4a95423264989ee57f783b395601e9131a2ede83f3911679538ddfc8c505c28a"
PKG_ARCH="x86_64"
PKG_LICENSE="GPLv2"
PKG_SITE="https://github.com/libretro/desmume"
PKG_URL="https://github.com/libretro/desmume/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain retroarch"
PKG_LONGDESC="DeSmuME is a Nintendo DS emulator"
PKG_TOOLCHAIN="manual"

PKG_LIBNAME="desmume_libretro.so"
PKG_LIBPATH="desmume/src/frontend/libretro/$PKG_LIBNAME"

make_target() {
  case $TARGET_CPU in
    arm1176jzf-s)
      make -C desmume/src/frontend/libretro -f Makefile.libretro platform=armv6-hardfloat-$TARGET_CPU
      ;;
    cortex-a7|cortex-a9)
      make -C desmume/src/frontend/libretro -f Makefile.libretro platform=armv7-neon-hardfloat-$TARGET_CPU
      ;;
    x86-64)
      make -C desmume/src/frontend/libretro -f Makefile.libretro
      ;;
  esac
}

makeinstall_target() {
    mkdir -p $INSTALL/usr/lib/libretro
    cp $PKG_LIBPATH $INSTALL/usr/lib/libretro/
}
