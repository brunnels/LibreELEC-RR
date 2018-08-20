# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 0riginally created by Escalade (https://github.com/escalade)
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="libretro-database"
PKG_VERSION="864ed36"
PKG_SHA256="8a02db9e05e61fbccb25179430133121ccd231a613313ef042d591e329ba19c7"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/libretro/libretro-database"
PKG_URL="https://github.com/libretro/libretro-database/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_SECTION="emulation"
PKG_SHORTDESC="Repository containing cheatcode files, content data files, etc."
PKG_LONGDESC="Repository containing cheatcode files, content data files, etc."
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
  rm $INSTALL/usr/share/retroarch/database/rdb/MAME.rdb
  rm $INSTALL/usr/share/retroarch/database/rdb/MAME\ 2000.rdb
  rm $INSTALL/usr/share/retroarch/database/rdb/MAME\ 2010.rdb
}
