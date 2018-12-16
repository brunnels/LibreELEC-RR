# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="lr-mrboom"
PKG_VERSION="6631ad839d82321e81ce7ee97ebba2baf40a9692" # v4.5+
PKG_SHA256="b566bee043a2ea7610638d583b907adf63a5ff668769bf1ec83b8517be725b0a"
PKG_LICENSE="GPLv3"
PKG_SITE="https://github.com/libretro/mrboom-libretro"
PKG_URL="https://github.com/libretro/mrboom-libretro/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain retroarch"
PKG_LONGDESC="Mr.Boom is an 8 player Bomberman clone for RetroArch/Libretro"
PKG_TOOLCHAIN="make"

PKG_LIBNAME="mrboom_libretro.so"
PKG_LIBPATH="$PKG_LIBNAME"

PKG_MAKE_OPTS_TARGET="GIT_VERSION=${PKG_VERSION:0:7}"

pre_make_target() {
  # Disable NEON otherwise build fails
  if target_has_feature neon; then
    CFLAGS+=" -DDONT_WANT_ARM_OPTIMIZATIONS" 
  fi
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
