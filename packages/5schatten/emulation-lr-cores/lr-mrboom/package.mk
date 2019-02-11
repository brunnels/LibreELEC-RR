# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="lr-mrboom"
PKG_VERSION="87a4af45ff35e693b4106ba1a340ab2111f61303" # v4.7
PKG_SHA256="5cce743b2cd4f7252c2d3491b326612b2a9174dcf31f8a1e5ec8dfbcff9551e1"
PKG_LICENSE="GPLv3"
PKG_SITE="https://github.com/libretro/mrboom-libretro"
PKG_URL="https://github.com/libretro/mrboom-libretro/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain linux glibc"
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
  mkdir -p $INSTALL/usr/bin
  mkdir -p $INSTALL/usr/config/retroarch/playlists
  mkdir -p $INSTALL/usr/lib/libretro

  #create Retroarch Playlist
  cp $PKG_DIR/files/* $INSTALL/usr/config/retroarch/playlists
  cp $PKG_DIR/scripts/* $INSTALL/usr/bin
  cp $PKG_LIBPATH $INSTALL/usr/lib/libretro/
}
