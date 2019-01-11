# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="pegasus-frontend"
PKG_VERSION="3ab18e026c0c639ddae9f7dd79740bd963d93faf" # Alpha 10+
PKG_LICENSE="GPLv3"
PKG_SITE="https://github.com/mmatyas/pegasus-frontend"
PKG_URL="https://github.com/mmatyas/pegasus-frontend.git"
PKG_DEPENDS_TARGET="toolchain SDL2-git qt-everywhere pegasus-theme-gameOS"
PKG_LONGDESC="A cross platform, customizable graphical frontend for launching emulators and managing your game collection."
GET_HANDLER_SUPPORT="git"
PKG_TOOLCHAIN="manual"

if [ ! "${PROJECT}" = "Amlogic" ]; then
  PKG_DEPENDS_TARGET+=" pegasus-theme-es2-simple"
fi

post_unpack() {
  cp -r ${PKG_DIR}/files/logos/* ${PKG_BUILD}/src/themes/pegasus-theme-grid/assets/logos
}

make_target() {
  mkdir -p $PKG_BUILD/.${TARGET_NAME}
  cd .${TARGET_NAME}
  qmake $PKG_BUILD/pegasus.pro INSTALLDIR=${INSTALL}/usr/bin \
                               INSTALL_BINDIR=${INSTALL}/usr/bin \
                               INSTALL_DATADIR=${INSTALL}/usr/bin \
                               INSTALL_ICONDIR=${INSTALL}/usr/bin \
                               INSTALL_DESKTOPDIR=${INSTALL}/usr/bin
  make
  make install
}

post_makeinstall_target() {
  # Install start scripts
  mkdir -p $INSTALL/usr/bin
  mkdir -p $INSTALL/usr/config/pegasus-frontend/themes
  echo "Place your Pegasus-Frontend Themes here!" >> $INSTALL/usr/config/pegasus-frontend/themes/readme.txt
  cp $PKG_DIR/scripts/pegasus-fe-${PROJECT}.start    $INSTALL/usr/bin/pegasus-fe.start

  # Clean up
  rm -rf $INSTALL/usr/bin/pegasus-fe.desktop
  rm -rf $INSTALL/usr/bin/pegasus-fe.png
}
