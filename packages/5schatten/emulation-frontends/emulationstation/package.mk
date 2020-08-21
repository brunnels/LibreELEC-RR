# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 0riginally created by Escalade (https://github.com/escalade)
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="emulationstation"
PKG_VERSION="12464024f057c4865219c854cde57b44b9cba089"
PKG_LICENSE="OSS"
PKG_SITE="https://github.com/RetroPie/EmulationStation"
PKG_URL="https://github.com/RetroPie/EmulationStation.git"
PKG_DEPENDS_TARGET="toolchain SDL2-git freetype curl freeimage vlc emulationstation-theme-carbon emulationstation-theme-simple-dark "
PKG_LONGDESC="A Fork of Emulation Station for RetroPie. Emulation Station is a flexible emulator front-end supporting keyboardless navigation and custom system themes."
PKG_BUILD_FLAGS="-gold"
GET_HANDLER_SUPPORT="git"

post_makeinstall_target() {
  # Create directories
  mkdir -p $INSTALL/etc/emulationstation
  mkdir -p $INSTALL/usr/config/emulationstation
  mkdir -p $INSTALL/usr/lib/tmpfiles.d

  # Create symlinks for themes & config files
  ln -s /usr/config/emulationstation/es_systems.cfg $INSTALL/etc/emulationstation/
  ln -s /usr/config/emulationstation/themes         $INSTALL/etc/emulationstation/themes

  # Install scripts
  cp $PKG_DIR/scripts/${PROJECT}/emulationstation.start $INSTALL/usr/bin/

  # Install resources
  cp -r $PKG_DIR/files/*     $INSTALL/usr/config/emulationstation/
  cp -a $PKG_BUILD/resources $INSTALL/usr/config/emulationstation/

  # Install config files
  cp $PKG_DIR/config/es_input.cfg          $INSTALL/usr/config/emulationstation/
  cp $PKG_DIR/config/es_settings.cfg       $INSTALL/usr/config/emulationstation/
  cp $PKG_DIR/config/${PROJECT}/es_systems.cfg                 $INSTALL/usr/config/emulationstation/
  cp $PKG_DIR/config/${PROJECT}/emulationstation-userdirs.conf $INSTALL/usr/lib/tmpfiles.d/
}
