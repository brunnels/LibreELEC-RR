# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="lr-snes9x2010"
PKG_VERSION="1b5ec5b"
PKG_SHA256="27f0aef2ab6f9398f18c3d6c708396bb6e47c0e74f7b9f20b806f9e49d510145"
PKG_ARCH="any"
PKG_LICENSE="GPLv3"
PKG_SITE="https://github.com/libretro/snes9x2010"
PKG_URL="https://github.com/libretro/snes9x2010/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain retroarch"
PKG_SECTION="emulation"
PKG_LONGDESC="Snes9x 2010. Port of Snes9x 1.52+ to Libretro (previously called SNES9x Next). Rewritten in C and several optimizations and speedhacks."
PKG_TOOLCHAIN="manual"

PKG_LIBNAME="snes9x2010_libretro.so"
PKG_LIBPATH="$PKG_LIBNAME"

make_target() {
  make -f Makefile.libretro GIT_VERSION=$PKG_VERSION
}

makeinstall_target() {
    mkdir -p $INSTALL/usr/lib/libretro
    cp $PKG_LIBPATH $INSTALL/usr/lib/libretro/
}
