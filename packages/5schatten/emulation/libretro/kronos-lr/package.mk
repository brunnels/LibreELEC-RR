# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2018-present Frank Hartung (supervisedthinking (@) gmail.com)

PKG_NAME="kronos-lr"
PKG_VERSION="6054b8fbecc6c741d78d5aa2e60d460150bac294"
PKG_SHA256="32560dcdf5b9bcfb035ea9e3722b1e78020ad99765f93851599e47e255696be2"
PKG_LICENSE="GPLv2"
PKG_SITE="https://github.com/libretro/yabause"
PKG_URL="https://github.com/libretro/yabause/archive/${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain linux glibc"
PKG_LONGDESC="Kronos is a Sega Saturn emulator forked from uoYabause. "
PKG_TOOLCHAIN="make"
PKG_BUILD_FLAGS="+lto"

PKG_LIBNAME="kronos_libretro.so"
PKG_LIBPATH="yabause/src/libretro/${PKG_LIBNAME}"

PKG_MAKE_OPTS_TARGET="-C yabause/src/libretro GIT_VERSION=${PKG_VERSION:0:7}"

configure_package() {
  # Displayserver Support
  if [ "${DISPLAYSERVER}" = "x11" ]; then
    PKG_DEPENDS_TARGET+=" xorg-server"
  fi

  # OpenGL Support
  if [ "${OPENGL_SUPPORT}" = "yes" ]; then
    PKG_DEPENDS_TARGET+=" ${OPENGL}"
  fi

  # OpenGLES Support
  if [ "${OPENGLES_SUPPORT}" = "yes" ]; then
    PKG_DEPENDS_TARGET+=" ${OPENGLES}"
    PKG_PATCH_DIRS="OpenGLES"
  fi
}

pre_configure_target() {
  if [ "${ARCH}" = "arm" ]; then
    if [ "${DEVICE}" = "RK3399" ]; then
      PKG_MAKE_OPTS_TARGET+=" platform=rockpro64"
    elif [ "${DEVICE}" = "AMLG12" ]; then
      PKG_MAKE_OPTS_TARGET+=" platform=amlg12"
    else
      PKG_MAKE_OPTS_TARGET+=" platform=armv"
      # ARM NEON support
      if target_has_feature neon; then
        PKG_MAKE_OPTS_TARGET+="-neon"
      fi
      PKG_MAKE_OPTS_TARGET+="-${TARGET_FLOAT}float-${TARGET_CPU}"
    fi
  fi
}

pre_make_target() {
  make CC=${HOST_CC} -C yabause/src/libretro generate-files
}

makeinstall_target() {
  mkdir -p ${INSTALL}/usr/lib/libretro
  cp -v ${PKG_LIBPATH} ${INSTALL}/usr/lib/libretro/
}
