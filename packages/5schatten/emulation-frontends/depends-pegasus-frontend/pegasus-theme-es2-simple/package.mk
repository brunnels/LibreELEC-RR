# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="pegasus-theme-es2-simple"
PKG_VERSION="e0747beabc90fe44af07ab2b95556f142487b344"
PKG_SHA256="07beec77be0030eb2d19eafbfdc87c6a17cbbdfd9b73abdf6e45da1baf63c3d7"
PKG_LICENSE="CC-BY-4.0"
PKG_SITE="https://github.com/mmatyas/pegasus-theme-es2-simple"
PKG_URL="https://github.com/mmatyas/pegasus-theme-es2-simple/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="ES2 Simple theme for Pegasus"
PKG_TOOLCHAIN="manual"

makeinstall_target() {
  mkdir -p $INSTALL/usr/share/pegasus-frontend/themes/pegasus-theme-es2-simple
  cp -r *  $INSTALL/usr/share/pegasus-frontend/themes/pegasus-theme-es2-simple
}
