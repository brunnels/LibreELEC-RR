# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2018-present Frank Hartung (supervisedthinking (@) gmail.com)

PKG_NAME="fceumm"
PKG_VERSION="81776d97c7644d745847e9bfabcde7f656036836"
PKG_SHA256="492aa5d97bb6472667dced431c6015b25052fe9f8dc0bdd276c92b44f4214ac4"
PKG_LICENSE="GPLv2"
PKG_SITE="https://github.com/libretro/libretro-fceumm"
PKG_URL="https://github.com/libretro/libretro-fceumm/archive/${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain linux glibc"
PKG_LONGDESC="Libretro port of the NES/Faimcom emulator FCE Ultra mappers mod project."
PKG_TOOLCHAIN="make"
PKG_BUILD_FLAGS="+lto"

PKG_LIBNAME="fceumm_libretro.so"
PKG_LIBPATH="${PKG_LIBNAME}"

PKG_MAKE_OPTS_TARGET="GIT_VERSION=${PKG_VERSION:0:7}"

pre_configure_target() {
  if [ "${ARCH}" = "arm" ]; then
    if [ "${PROJECT}" = "RPi" ]; then
      case ${DEVICE} in
        RPi)
          PKG_MAKE_OPTS_TARGET+=" platform=rpi1"
        ;;
        RPi2)
          PKG_MAKE_OPTS_TARGET+=" platform=rpi2"
        ;;
      esac
    else
      PKG_MAKE_OPTS_TARGET+=" platform=armv-${TARGET_FLOAT}float-${TARGET_CPU}"
    fi
  fi
}

makeinstall_target() {
  mkdir -p ${INSTALL}/usr/lib/libretro
  cp -v ${PKG_LIBPATH} ${INSTALL}/usr/lib/libretro/
}
