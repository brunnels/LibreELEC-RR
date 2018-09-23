# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 0riginally created by Escalade (https://github.com/escalade)
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="libretro-mame2003-plus"
PKG_VERSION="5b8b878"
PKG_SHA256="1b3589cdd3954c30ca90a2114a13b89d2f355214012ac074bfa04c3f77ffc59a"
PKG_ARCH="any"
PKG_LICENSE="GPLv2"
PKG_SITE="https://github.com/libretro/mame2003-plus-libretro"
PKG_URL="https://github.com/libretro/mame2003-plus-libretro/archive/$PKG_VERSION.tar.gz"
PKG_SOURCE_DIR="mame2003-plus-libretro-$PKG_VERSION*"
PKG_DEPENDS_TARGET="toolchain"
PKG_SECTION="emulation"
PKG_LONGDESC="Updated 2018 version of MAME (0.78) for libretro. with added game support plus many fixes and improvements"

PKG_LIBNAME="mame2003_plus_libretro.so"
PKG_LIBPATH="$PKG_LIBNAME"
PKG_LIBVAR="MAME2003PLUS_LIB"

configure_target() {
  export LD="$CC"
}

make_target() {
  make GIT_VERSION=$PKG_VERSION
}

makeinstall_target() {
  if [ ! "$OEM_EMU" = "no" ]; then
    mkdir -p $INSTALL/usr/lib/libretro
    cp $PKG_LIBPATH $INSTALL/usr/lib/libretro/
  fi
}
