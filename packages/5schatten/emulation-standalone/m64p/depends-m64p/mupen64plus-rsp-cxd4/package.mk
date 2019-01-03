# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="mupen64plus-rsp-cxd4"
PKG_VERSION="62244037ce5c04451760a5195da30823995196b9"
PKG_SHA256="9ade4834f633eb2f5c6554620f6596b9c681057eeaf7798f3d84c257c1b69b07"
PKG_LICENSE="CC0-1.0"
PKG_SITE="https://github.com/mupen64plus/mupen64plus-rsp-cxd4"
PKG_URL="https://github.com/mupen64plus/mupen64plus-rsp-cxd4/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain SDL2-git mupen64plus-core"
PKG_LONGDESC="Exemplary MSP communications simulator using a normalized VU."
PKG_TOOLCHAIN="make"

PKG_MAKE_OPTS_TARGET="-f projects/unix/Makefile SRCDIR=. APIDIR=$(get_build_dir mupen64plus-core)/src/api all HLEVIDEO=1"

pre_configure_target() {
  export SYSROOT_PREFIX=$SYSROOT_PREFIX

  # ARCH arm
  if [ "${ARCH}" = "arm" ]; then
    PKG_MAKE_OPTS_TARGET+=" HOST_CPU=arm"
  fi
}

makeinstall_target() {
 :
}
