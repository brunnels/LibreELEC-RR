# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 0riginally created by Escalade (https://github.com/escalade)
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="libretro-database"
PKG_VERSION="122a92f"
PKG_SHA256="f08c575ac6d5a9e66cbca777ee847b2c28f1ba65407464c00ac8736699e62edd"
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

  #remove oldest & unneeded MAME 2000 database use mame2003-plus instead
  rm $INSTALL/usr/share/retroarch/database/rdb/MAME\ 2000.rdb

  #remove unneeded MAME databases for SBC based systems
  if [ "$PROJECT" == "Amlogic" ] || [ "$PROJECT" == "RPi" ]; then
    rm $INSTALL/usr/share/retroarch/database/rdb/MAME.rdb
    rm $INSTALL/usr/share/retroarch/database/rdb/MAME\ 2014.rdb
  fi

  #workaround until a MAME 2003-Plus database for romset 0.78+ is included
  if [ ! -f "$INSTALL/usr/share/retroarch/database/rdb/MAME 2003-Plus.rdb" ]; then
    ln -sf "/usr/share/retroarch/database/rdb/MAME 2003.rdb" "$INSTALL/usr/share/retroarch/database/rdb/MAME 2003-Plus.rdb"
  fi

  #workaround until a MAME 2016 database for romset 0.174 is included
  if [ ! -f "$INSTALL/usr/share/retroarch/database/rdb/MAME 2016.rdb" ] && [ "$PROJECT" == "Generic" ]; then
    ln -sf /usr/share/retroarch/database/rdb/MAME.rdb "$INSTALL/usr/share/retroarch/database/rdb/MAME 2016.rdb"
  fi
}
