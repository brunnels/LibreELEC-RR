# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 0riginally created by Escalade (https://github.com/escalade)
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="lr-database"
PKG_VERSION="fd2ce882b7124436d1b3d99e0d19ccdff2b2ded3"
PKG_SHA256="159bcd7848b18d8292874685d7eb49b45acb1fd2aced13dc8632428ec2125acf"
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
  if [ "${PROJECT}" = "Amlogic_Legacy" ] || [ "${PROJECT}" = "RPi" ]; then
    rm $INSTALL/usr/share/retroarch/database/rdb/MAME.rdb
    rm $INSTALL/usr/share/retroarch/database/rdb/MAME\ 2015.rdb
  fi

  #workaround until a MAME 2016 database for romset 0.174 is included
  if [ ! -f "$INSTALL/usr/share/retroarch/database/rdb/MAME 2016.rdb" ] && [ "${PROJECT}" = "Generic" ]; then
    ln -sf /usr/share/retroarch/database/rdb/MAME.rdb "$INSTALL/usr/share/retroarch/database/rdb/MAME 2016.rdb"
  fi
}
