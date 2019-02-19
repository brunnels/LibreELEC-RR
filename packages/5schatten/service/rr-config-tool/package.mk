# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2019-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="rr-config-tool"
PKG_VERSION="1.0"
PKG_REV="100"
PKG_ARCH="any"
PKG_LICENSE="GPLv2"
PKG_DEPENDS_TARGET="toolchain"
PKG_SECTION="service"
PKG_SHORTDESC="RR Config Tool"
PKG_LONGDESC="RR Config Tool provides a graphical interface to configure audio, video etc. for the RR build."
PKG_TOOLCHAIN="manual"

PKG_IS_ADDON="yes"
PKG_ADDON_NAME="RR Config Tool"
PKG_ADDON_TYPE="xbmc.service.library"
PKG_MAINTAINER="5schatten"

makeinstall_target() {
  mkdir -p $INSTALL/usr/share/$MEDIACENTER/addons/$PKG_SECTION.$PKG_NAME
  mkdir -p $INSTALL/usr/share/$MEDIACENTER/addons/$PKG_SECTION.$PKG_NAME/resources
  mkdir -p $INSTALL/usr/lib/$MEDIACENTER/addons/$PKG_SECTION.$PKG_NAME
  cp $PKG_DIR/icons/* $INSTALL/usr/share/$MEDIACENTER/addons/$PKG_SECTION.$PKG_NAME/resources
  install_addon_files $INSTALL/usr/share/$MEDIACENTER/addons/$PKG_SECTION.$PKG_NAME
}
