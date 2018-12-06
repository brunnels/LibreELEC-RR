# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="pegasus-theme-es2-simple"
PKG_VERSION="b2147018a88e3b69b69dad67bf4e9991293df3c5"
PKG_SHA256="a5ae4941561866c1bf85a9f48db5f96e6412d846ca4fa29a5e67368d5fc59e32"
PKG_LICENSE="CC-BY-4.0"
PKG_SITE="https://github.com/mmatyas/pegasus-theme-es2-simple"
PKG_URL="https://github.com/mmatyas/pegasus-theme-es2-simple/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="ES2 Simple theme for Pegasus"
PKG_TOOLCHAIN="manual"

makeinstall_target() {
  mkdir -p $INSTALL/usr/config/pegasus-frontend/themes/pegasus-theme-es2-simple
  cp -r * $INSTALL/usr/config/pegasus-frontend/themes/pegasus-theme-es2-simple
}
