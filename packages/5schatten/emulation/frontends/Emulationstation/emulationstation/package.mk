# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2018-present Frank Hartung (supervisedthinking (@) gmail.com)

PKG_NAME="emulationstation"
PKG_VERSION="d62758c7cf88154ef05177217e4a0a33bbda02d2" #v2.9.0-dev
PKG_LICENSE="OSS"
PKG_SITE="https://github.com/RetroPie/EmulationStation"
PKG_URL="https://github.com/RetroPie/EmulationStation.git"
PKG_DEPENDS_TARGET="toolchain linux glibc systemd dbus openssl zlib libpng alsa-lib SDL2-system freetype curl freeimage bzip2 vlc emulationstation-theme-carbon emulationstation-theme-simple-dark "
PKG_LONGDESC="A Fork of Emulation Station for RetroPie. Emulation Station is a flexible emulator front-end supporting keyboardless navigation and custom system themes."
GET_HANDLER_SUPPORT="git"
PKG_GIT_CLONE_BRANCH="master"
PKG_BUILD_FLAGS="+lto"

configure_package() {
  # Displayserver Support
  if [ "${DISPLAYSERVER}" = "x11" ]; then
    PKG_DEPENDS_TARGET+=" xorg-server unclutter-xfixes"
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

pre_configure_target() {
  PKG_CMAKE_OPTS_TARGET="-DUSE_LIBCEC=OFF"
}

post_makeinstall_target() {
  # Create directories
  mkdir -p $INSTALL/etc/emulationstation
  mkdir -p $INSTALL/usr/config/emulationstation
  mkdir -p $INSTALL/usr/lib/tmpfiles.d

  # Create symlinks for themes & config files
  ln -s /usr/config/emulationstation/es_systems.cfg $INSTALL/etc/emulationstation/
  ln -s /usr/config/emulationstation/themes         $INSTALL/etc/emulationstation/themes

  # Install scripts
  cp -rf $PKG_DIR/scripts/common/*     $INSTALL/usr/bin/
  cp -rf $PKG_DIR/scripts/${PROJECT}/* $INSTALL/usr/bin/

  # Install resources
  cp -r $PKG_DIR/files/*     $INSTALL/usr/config/emulationstation/
  cp -a $PKG_BUILD/resources $INSTALL/usr/config/emulationstation/

  # Install config files
  cp $PKG_DIR/config/es_input.cfg          $INSTALL/usr/config/emulationstation/
  cp $PKG_DIR/config/es_settings.cfg       $INSTALL/usr/config/emulationstation/
  cp $PKG_DIR/config/${PROJECT}/es_systems.cfg                 $INSTALL/usr/config/emulationstation/
  cp $PKG_DIR/config/${PROJECT}/userdirs-emulationstation.conf $INSTALL/usr/lib/tmpfiles.d/
}