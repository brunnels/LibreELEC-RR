# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="lr-vice"
PKG_VERSION="b35a177"
PKG_SHA256="0b8edf7284637a7552335b10dad0d6bf5895ca63b273b5a04a8fc88295777ad4"
PKG_LICENSE="GPLv2"
PKG_SITE="https://github.com/libretro/vice-libretro"
PKG_URL="https://github.com/libretro/vice-libretro/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain retroarch"
PKG_LONGDESC="Versatile Commodore 8-bit Emulator version 3.0 LIBRETRO WIP"

PKG_LIBNAME="vice_x64_libretro.so"
PKG_LIBPATH="$PKG_LIBNAME"

pre_build_target() {
  export GIT_VERSION=$PKG_VERSION
}

make_target() {
  make -f Makefile.libretro CC=$CC
}

makeinstall_target() {
    mkdir -p $INSTALL/usr/lib/libretro
    cp $PKG_LIBPATH $INSTALL/usr/lib/libretro/
}
