# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 0riginally created by Escalade (https://github.com/escalade)
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="retroarch-assets"
PKG_VERSION="fceb684bfc434741b4beda82c771297685e02b05"
PKG_SHA256="ce08641832206ab74bdc54f7ac326c624980a15dc6a42d66171591cf87c34b19"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/libretro/retroarch-assets"
PKG_URL="https://github.com/libretro/retroarch-assets/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="RetroArch assets. Background and icon themes for the menu drivers."
PKG_TOOLCHAIN="manual"

pre_configure_target() {
  cd ../
  rm -rf .$TARGET_NAME
}

makeinstall_target() {
  make install DESTDIR=$INSTALL PREFIX=/usr
}

post_makeinstall_target() {
  mv $INSTALL/usr/share/libretro $INSTALL/usr/share/retroarch
}
