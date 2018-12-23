# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="pegasus-frontend"
PKG_VERSION="765650dd4d87bcd8ee7c9392864e341e61c7b76b" # Alpha 10+
PKG_LICENSE="GPLv3"
PKG_SITE="https://github.com/mmatyas/pegasus-frontend"
PKG_URL="https://github.com/mmatyas/pegasus-frontend.git"
PKG_DEPENDS_TARGET="toolchain SDL2-git qt-everywhere pegasus-theme-es2-simple"
PKG_LONGDESC="A cross platform, customizable graphical frontend for launching emulators and managing your game collection."
GET_HANDLER_SUPPORT="git"
PKG_TOOLCHAIN="manual"

post_unpack() {
  cp -r ${PKG_DIR}/files/logos/* ${PKG_BUILD}/src/themes/pegasus-theme-grid/assets/logos
}

make_target() {
  cd $PKG_BUILD
  mkdir -p .${TARGET_NAME}
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
  cp $PKG_DIR/scripts/pegasus-fe-${PROJECT}.start $INSTALL/usr/bin/pegasus-fe.start

  # Clean up
  rm -rf $INSTALL/usr/bin/pegasus-fe.desktop
  rm -rf $INSTALL/usr/bin/pegasus-fe.png
}
