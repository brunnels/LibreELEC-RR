# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2018-present Frank Hartung (supervisedthinking@gmail.com)

PKG_NAME="pegasus-frontend"
PKG_VERSION="d41233eb26d892d9ed7e961dee6f6db629d1a02f" # Continuous build
PKG_LICENSE="GPLv3"
PKG_SITE="https://github.com/mmatyas/pegasus-frontend"
PKG_URL="https://github.com/mmatyas/pegasus-frontend.git"
PKG_DEPENDS_TARGET="toolchain linux glibc zlib libpng SDL2-git qt-everywhere pegasus-theme-es2-simple pegasus-theme-gameOS"
PKG_LONGDESC="A cross platform, customizable graphical frontend for launching emulators and managing your game collection."
GET_HANDLER_SUPPORT="git"
PKG_TOOLCHAIN="make"

post_unpack() {
  cp -r ${PKG_DIR}/files/logos/* ${PKG_BUILD}/src/themes/pegasus-theme-grid/assets/logos
}

configure_package() {
  # Displayserver Support
  if [ "${DISPLAYSERVER}" = "x11" ]; then
    PKG_DEPENDS_TARGET+=" xorg-server"
  fi

  # OpenGL Support
  if [ "${OPENGL_SUPPORT}" = "yes" ]; then
    PKG_DEPENDS_TARGET+=" ${OPENGL}"
  fi

  # OpenGLES Support
  if [ "${OPENGLES_SUPPORT}" = "yes" ]; then
    PKG_DEPENDS_TARGET+=" ${OPENGLES}"
  fi
}

configure_target() {
  # Create working dir
  mkdir -p ${PKG_BUILD}/.${TARGET_NAME}
  cd .${TARGET_NAME}

  # Generate qmake config
  qmake ${PKG_BUILD}/pegasus.pro INSTALLDIR=${INSTALL}/usr/bin \
                                 INSTALL_BINDIR=${INSTALL}/usr/bin \
                                 INSTALL_DATADIR=${INSTALL}/usr/bin \
                                 INSTALL_ICONDIR=${INSTALL}/usr/bin \
                                 INSTALL_DESKTOPDIR=${INSTALL}/usr/bin
}

post_makeinstall_target() {
  # Install start scripts
  mkdir -p ${INSTALL}/usr/bin
  mkdir -p ${INSTALL}/usr/config/pegasus-frontend/themes
  echo "Place your Pegasus-Frontend Themes here!" > ${INSTALL}/usr/config/pegasus-frontend/themes/readme.txt
  cp ${PKG_DIR}/scripts/${PROJECT}/pegasus-fe.start ${INSTALL}/usr/bin/

  # Clean up
  rm -rf ${INSTALL}/usr/bin/pegasus-fe.desktop
  rm -rf ${INSTALL}/usr/bin/pegasus-fe.png
}
