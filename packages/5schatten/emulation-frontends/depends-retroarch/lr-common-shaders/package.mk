# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="lr-common-shaders"
PKG_VERSION="39a15c02b777111fecdc9e1b38843596762ee28b"
PKG_SHA256="3cbb35d9340fb5f47864f8fec320ab28b5d75ac72f3192460b8f958b4d6a55a4"
PKG_LICENSE="MIT"
PKG_SITE="https://github.com/libretro/common-shaders"
PKG_URL="https://github.com/libretro/common-shaders/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="Collection of commonly used Cg shaders."
PKG_TOOLCHAIN="manual"

makeinstall_target() {
  cd ${PKG_BUILD}
  make install INSTALLDIR="$INSTALL/usr/share/retroarch/shaders/common"
}
