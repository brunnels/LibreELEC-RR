# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 0riginally created by Escalade (https://github.com/escalade)
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="emulationstation-theme-simple-dark"
PKG_VERSION="4c33193"
PKG_SHA256="07f2cc90a2966c1f66a799c6d8171401f547474f3d95db1838d67e2a1ab20bb9"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/RetroPie/es-theme-simple-dark.git"
PKG_URL="https://github.com/RetroPie/es-theme-simple-dark/archive/$PKG_VERSION.tar.gz"
PKG_SOURCE_DIR="es-theme-simple-dark-$PKG_VERSION*"
PKG_DEPENDS_TARGET="toolchain"
PKG_SECTION="emulation"
PKG_SHORTDESC="Simple dark theme for Emulationstation"
PKG_TOOLCHAIN="manual"

makeinstall_target() {
  mkdir -p $INSTALL/etc/emulationstation/themes/es-theme-simple-dark
  mkdir -p $INSTALL/usr/share/kodi/addons/resource.uisounds.kodi/resources
  cp -r * $INSTALL/etc/emulationstation/themes/es-theme-simple-dark

  #adding additional themes
  cp -a $PKG_DIR/files/2048 $INSTALL/etc/emulationstation/themes/es-theme-simple-dark/
  cp -a $PKG_DIR/files/mrboom $INSTALL/etc/emulationstation/themes/es-theme-simple-dark/
  cp -a $PKG_DIR/files/moonlight $INSTALL/etc/emulationstation/themes/es-theme-simple-dark/
  cp -a $PKG_DIR/files/prboom $INSTALL/etc/emulationstation/themes/es-theme-simple-dark/
  cp -a $PKG_DIR/files/tyrquake $INSTALL/etc/emulationstation/themes/es-theme-simple-dark/

  #adding additional themes for generic
  if [ "$PROJECT" == "Generic" ]; then
    cp -a $PKG_DIR/files/n3ds $INSTALL/etc/emulationstation/themes/es-theme-simple-dark/
  fi

  #adding additional themes for generic || RPi
  if [ "$PROJECT" == "Generic" ] || [ "$PROJECT" == "RPi" ]; then
    cp -a $PKG_DIR/files/chailove $INSTALL/etc/emulationstation/themes/es-theme-simple-dark/
  fi

  #adding click sounds
  cp $PKG_DIR/files/scroll.wav $INSTALL/etc/emulationstation/themes/es-theme-simple-dark/art/
  cp $PKG_DIR/files/scroll.wav $INSTALL/usr/share/kodi/addons/resource.uisounds.kodi/resources/back.wav
  cp $PKG_DIR/files/scroll.wav $INSTALL/usr/share/kodi/addons/resource.uisounds.kodi/resources/click.wav
  cp $PKG_DIR/files/scroll.wav $INSTALL/usr/share/kodi/addons/resource.uisounds.kodi/resources/cursor.wav
}
