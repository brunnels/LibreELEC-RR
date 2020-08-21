# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2018-present Frank Hartung (supervisedthinking@gmail.com)

PKG_NAME="retroarch-joypad-autoconfig"
PKG_VERSION="6297c681a1d785e693a8c6accf055f9b8ca4d68e"
PKG_SHA256="0b5d3e3aa1fb31ab7114c5fdccba2c9f30b624b4abe5ac3c25e38d31a8eb1f8f"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/libretro/retroarch-joypad-autoconfig"
PKG_URL="https://github.com/libretro/retroarch-joypad-autoconfig/archive/${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="RetroArch joypad autoconfig files"
PKG_TOOLCHAIN="manual"

makeinstall_target() {
  cd ${PKG_BUILD}
  make install INSTALLDIR="${INSTALL}/usr/share/retroarch/autoconfig"
}

post_makeinstall_target () {
  cp -av ${PKG_DIR}/config/* ${INSTALL}/usr/share/retroarch/autoconfig
}
