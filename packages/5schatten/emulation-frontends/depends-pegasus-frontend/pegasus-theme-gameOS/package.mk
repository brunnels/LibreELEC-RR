# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="pegasus-theme-gameOS"
PKG_VERSION="3f49d84eacc62a6dfb487fcf15131d5594df3315" # v0.5
PKG_SHA256="94b1c0b5da0c6960dd5fb0f405b4b0909f227129166cf523f6840cef220294c9"
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
