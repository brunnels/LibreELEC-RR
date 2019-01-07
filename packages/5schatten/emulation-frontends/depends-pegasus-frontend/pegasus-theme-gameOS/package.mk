# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="pegasus-theme-gameOS"
PKG_VERSION="e08c23c540a0ff19e8d40cfd8fa3f5ae1af1b4f3"
PKG_SHA256="3b69134e430fc7dd9214b350580c33c736b1766d57ac8270e419661347f75300"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/PlayingKarrde/gameOS"
PKG_URL="https://github.com/PlayingKarrde/gameOS/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="gameOS theme for Pegasus Frontend"
PKG_TOOLCHAIN="manual"

makeinstall_target() {
  mkdir -p $INSTALL/usr/share/pegasus-frontend/themes/gameOS
  cp -r *  $INSTALL/usr/share/pegasus-frontend/themes/gameOS
}
