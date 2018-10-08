# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="lr-yabause"
PKG_VERSION="fae9682"
PKG_SHA256="b48318d2192d06edc6d4e22c3fa508a625716b31216a34aec74c7d5edc205511"
PKG_ARCH="any"
PKG_LICENSE="GPLv2"
PKG_SITE="https://github.com/libretro/yabause"
PKG_URL="https://github.com/libretro/yabause/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain retroarch"
PKG_SECTION="emulation"
PKG_LONGDESC="Yabause is a Sega Saturn emulator."
PKG_TOOLCHAIN="manual"

PKG_LIBNAME="yabause_libretro.so"
PKG_LIBPATH="libretro/$PKG_LIBNAME"

make_target() {
  make -C libretro GIT_VERSION=$PKG_VERSION
}

makeinstall_target() {
    mkdir -p $INSTALL/usr/lib/libretro
    cp $PKG_LIBPATH $INSTALL/usr/lib/libretro/
}
