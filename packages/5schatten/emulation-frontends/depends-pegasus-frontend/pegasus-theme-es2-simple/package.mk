# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="pegasus-theme-es2-simple"
PKG_VERSION="ed3138e819762ef6fd9fbd3f3ed0a38f319c02fc"
PKG_SHA256="30ad3185d7ad1d6bc1de9f5663727cf3de091f90412161648f9bf97c6d7d9af0"
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
