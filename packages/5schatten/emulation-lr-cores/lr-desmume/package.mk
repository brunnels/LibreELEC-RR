# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="lr-desmume"
PKG_VERSION="5c8ba82e33fcae235fd7897d4c4c1b4a7bd74fb2"
PKG_SHA256="c608f9e8a30440c886f27dfb0571e0a30b1ad628c66d3700c8c8d1eded00439b"
PKG_LICENSE="GPLv2"
PKG_SITE="https://github.com/libretro/desmume"
PKG_URL="https://github.com/libretro/desmume/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain retroarch libpcap"
PKG_LONGDESC="DeSmuME is a Nintendo DS emulator"
PKG_TOOLCHAIN="make"

PKG_LIBNAME="desmume_libretro.so"
PKG_LIBPATH="desmume/src/frontend/libretro/$PKG_LIBNAME"

# Disable OpenGL if not supported
if [ ! $OPENGL_SUPPORT = "yes" ]; then
  PKG_PATCH_DIRS="no-opengl"
fi

PKG_MAKE_OPTS_TARGET="-C desmume/src/frontend/libretro -f Makefile.libretro GIT_VERSION=${PKG_VERSION:0:7}"

pre_make_target() {
  case $TARGET_CPU in
    arm1176jzf-s)
      PKG_MAKE_OPTS_TARGET+=" platform=armv6-hardfloat-$TARGET_CPU"
      ;;
    cortex-a7|cortex-a9|cortex-a53)
      PKG_MAKE_OPTS_TARGET+=" platform=armv7-neon-hardfloat-$TARGET_CPU"
      ;;
  esac
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/lib/libretro
  cp $PKG_LIBPATH $INSTALL/usr/lib/libretro/
}
