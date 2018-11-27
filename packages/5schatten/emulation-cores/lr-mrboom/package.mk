# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="lr-mrboom"
PKG_VERSION="dec629bcb9dabef2e15aceb9a0fca9bc67be7862" # v4.5+
PKG_SHA256="0e10b3a16f47e58410946992e88ca78b77a367f0d75d9c307769fc34a5364d2e"
PKG_LICENSE="GPLv3"
PKG_SITE="https://github.com/libretro/mrboom-libretro"
PKG_URL="https://github.com/libretro/mrboom-libretro/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain retroarch"
PKG_LONGDESC="Mr.Boom is an 8 player Bomberman clone for RetroArch/Libretro"

PKG_LIBNAME="mrboom_libretro.so"
PKG_LIBPATH="$PKG_LIBNAME"

make_target() {
  # Disable NEON otherwise build fails
  if target_has_feature neon; then
    CFLAGS="$CFLAGS -DDONT_WANT_ARM_OPTIMIZATIONS" 
  fi

  make clean
  make GIT_VERSION=${PKG_VERSION:0:7}
}

makeinstall_target() {
  #create Retroarch Playlist
  mkdir -p $INSTALL/usr/config
  mkdir -p $INSTALL/usr/config/retroarch
  mkdir -p $INSTALL/usr/config/retroarch/playlists
  cp $PKG_DIR/files/* $INSTALL/usr/config/retroarch/playlists

  mkdir -p $INSTALL/usr/lib/libretro
  cp $PKG_LIBPATH $INSTALL/usr/lib/libretro/
}
