# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="lr-desmume"
PKG_VERSION="31015400924802280700d0daa5418dfccb59d638"
PKG_SHA256="b154c01ea235026fe02145df8e1176581912578e4006f9424f9b0c34caa96dbb"
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
