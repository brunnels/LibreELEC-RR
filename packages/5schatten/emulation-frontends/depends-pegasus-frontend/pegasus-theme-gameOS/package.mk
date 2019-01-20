# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="pegasus-theme-gameOS"
PKG_VERSION="8d947875c9b805a5c7f66b4c502ef34224bf2b5f" # v0.5
PKG_SHA256="5048dbf4b37a9d790a8a8f0f1151e115e1d453d87975594754690ce821c20d70"
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
