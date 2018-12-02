# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 0riginally created by Escalade (https://github.com/escalade)
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="lr-database"
PKG_VERSION="6d8399d49a97fc438439fcecb37c616209eb6c02"
PKG_SHA256="2114a128618ce371e9fa2cb1f3da1da0f89bdb3ec2818fd38a69dc27e57301bb"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/libretro/libretro-database"
PKG_URL="https://github.com/libretro/libretro-database/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="Repository containing cheatcode files, content data files, etc."
PKG_TOOLCHAIN="manual"

pre_configure_target() {
  cd ../
  rm -rf .$TARGET_NAME
}

makeinstall_target() {
  make install INSTALLDIR="$INSTALL/usr/share/retroarch/database"
}

post_makeinstall_target() {
  #remove oldest & unneeded MAME 2000 database use mame2003-plus instead
  rm "$INSTALL/usr/share/retroarch/database/rdb/MAME 2000.rdb"

  #remove unneeded MAME databases for SBC based systems
  if [ "${PROJECT}" = "Amlogic" ] || [ "${PROJECT}" = "RPi" ]; then
    rm $INSTALL/usr/share/retroarch/database/rdb/MAME.rdb
    rm $INSTALL/usr/share/retroarch/database/rdb/MAME\ 2014.rdb
  fi

  #workaround until a MAME 2016 database for romset 0.174 is included
  if [ ! -f "$INSTALL/usr/share/retroarch/database/rdb/MAME 2016.rdb" ] && [ "${PROJECT}" = "Generic" ]; then
    ln -sf /usr/share/retroarch/database/rdb/MAME.rdb "$INSTALL/usr/share/retroarch/database/rdb/MAME 2016.rdb"
  fi
}
