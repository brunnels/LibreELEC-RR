# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="google-chrome"
PKG_VERSION="latest"
PKG_ARCH="any"
PKG_LICENSE="Freeware"
PKG_SITE="http://www.google.com/chrome"
PKG_DEPENDS_TARGET="toolchain gtk3 libXcomposite libXcursor libxss nss gconf scrnsaverproto atk cups unclutter"
PKG_SECTION="apps"
PKG_SHORTDESC="Google Chrome browser"
PKG_TOOLCHAIN="manual"

makeinstall_target() {
  # creating directories
  mkdir -p $INSTALL/usr/bin
  mkdir -p $INSTALL/usr/config
  mkdir -p $INSTALL/usr/config/google-chrome
  mkdir -p $INSTALL/usr/share/applications
  mkdir -p $INSTALL/opt/google
  
  # copy scripts, config files & resources
  cp $PKG_DIR/files/google-chrome-stable $INSTALL/usr/bin/
  cp $PKG_DIR/files/chrome-flags.conf $INSTALL/usr/config/google-chrome/
  cp $PKG_DIR/files/icon.png $INSTALL/usr/config/google-chrome/
  cp $PKG_DIR/files/mimeapps.list $INSTALL/usr/share/applications/

  # creating symlinks to working directories
  ln -s /storage/.cache/app.chrome/google-chrome.desktop $INSTALL/usr/share/applications/
  ln -s /storage/.cache/app.chrome $INSTALL/opt/google/chrome
}
