# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2018-present Frank Hartung (supervisedthinking (@) gmail.com)

PKG_NAME="kronos"
PKG_VERSION="29d9e81c531b17678dfa102a655bce780674d7bf"
PKG_SHA256="f6cfd03fec27a010bafc9781c8e25e5e7e253de4aa1023e3fe5e5d435b7014bc"
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
