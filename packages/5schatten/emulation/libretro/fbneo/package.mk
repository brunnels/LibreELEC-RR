# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2018-present Frank Hartung (supervisedthinking (@) gmail.com)

PKG_NAME="fbneo"
PKG_VERSION="ad3c16abf57b07d5ee9e94af826cc84875ea0e28"
PKG_SHA256="c9ae4888fea18f10c533adbece93fe3ccc56beb4e7a8440a358afe0406ac7482"
PKG_LICENSE="OSS"
PKG_SITE="https://github.com/libretro/FBNeo"
PKG_URL="https://github.com/libretro/FBNeo/archive/${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain linux glibc"
PKG_LONGDESC="A libretro port of FinalBurn Neo for Romset v0.2.97.44"
PKG_TOOLCHAIN="make"
PKG_BUILD_FLAGS="+lto"

PKG_LIBNAME="fbneo_libretro.so"
PKG_LIBPATH="src/burner/libretro/${PKG_LIBNAME}"

PKG_MAKE_OPTS_TARGET="-C src/burner/libretro/ GIT_VERSION=${PKG_VERSION:0:7}"

pre_configure_target() {
  if [ "${PROJECT}" = "RPi" ]; then
    case ${DEVICE} in
      RPi)
        PKG_MAKE_OPTS_TARGET+=" platform=armv"
        ;;
      RPi2)
        PKG_MAKE_OPTS_TARGET+=" platform=rpi2"
        ;;
    esac
  else
    # NEON Support ?
    if target_has_feature neon; then
      PKG_MAKE_OPTS_TARGET+=" HAVE_NEON=1"
    fi
  fi
}

makeinstall_target() {
  mkdir -p ${INSTALL}/usr/lib/libretro
  cp -v ${PKG_LIBPATH} ${INSTALL}/usr/lib/libretro/
}
