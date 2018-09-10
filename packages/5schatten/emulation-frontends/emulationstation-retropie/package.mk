# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 0riginally created by Escalade (https://github.com/escalade)
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="emulationstation-retropie"
PKG_VERSION="dc541e5"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/RetroPie/EmulationStation"
PKG_URL="https://github.com/RetroPie/EmulationStation.git"
PKG_SOURCE_DIR="EmulationStation-$PKG_VERSION*"
PKG_DEPENDS_TARGET="toolchain SDL2 freetype curl cmake:host freeimage emulationstation-theme-simple-dark vlc"
PKG_SECTION="emulation"
PKG_LONGDESC="A Fork of Emulation Station for RetroPie. Emulation Station is a flexible emulator front-end supporting keyboardless navigation and custom system themes."
PKG_BUILD_FLAGS="-gold"
GET_HANDLER_SUPPORT="git"

if [ "$PROJECT" == "Amlogic" ]; then
  PKG_CMAKE_OPTS_TARGET=-DGLES=ON
fi

post_makeinstall_target() {  
  mkdir -p $INSTALL/etc/emulationstation
  mkdir -p $INSTALL/usr/config/emulationstation
  mkdir -p $INSTALL/usr/lib/tmpfiles.d
  ln -s /storage/.config/emulationstation/es_systems.cfg $INSTALL/etc/emulationstation/
  
  cp $PKG_DIR/scripts/* $INSTALL/usr/bin
  cp $PKG_DIR/config/emulationstation.conf $INSTALL/usr/config/emulationstation/
  cp $PKG_DIR/config/es_input.cfg $INSTALL/usr/config/emulationstation/
  cp $PKG_DIR/config/es_settings.cfg $INSTALL/usr/config/emulationstation/
  cp -a ../resources $INSTALL/usr/config/emulationstation/

  case $PROJECT in
    Amlogic)
      cp $PKG_DIR/config/$PROJECT/es_systems-$PROJECT.cfg $INSTALL/usr/config/emulationstation/es_systems.cfg
      cp $PKG_DIR/config/$PROJECT/emulationstation-userdirs-$PROJECT.conf $INSTALL/usr/lib/tmpfiles.d/emulationstation-userdirs.conf
      ;;
    Generic)
      cp $PKG_DIR/config/$PROJECT/es_systems-$PROJECT.cfg $INSTALL/usr/config/emulationstation/es_systems.cfg
      cp $PKG_DIR/config/$PROJECT/emulationstation-userdirs-$PROJECT.conf $INSTALL/usr/lib/tmpfiles.d/emulationstation-userdirs.conf
      ;;
    RPi*)
      cp $PKG_DIR/config/$PROJECT/es_systems-$PROJECT.cfg $INSTALL/usr/config/emulationstation/es_systems.cfg
      cp $PKG_DIR/config/$PROJECT/emulationstation-userdirs-$PROJECT.conf $INSTALL/usr/lib/tmpfiles.d/emulationstation-userdirs.conf
      ;;
  esac
}
