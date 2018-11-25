# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 0riginally created by Escalade (https://github.com/escalade)
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="lr-mame2003-plus"
PKG_VERSION="476d81fb9dd732d1a020b78d34de9de1af65db2c"
PKG_SHA256="fdb1d1a3bbcd5f302f4f0087e4eccf81a647012bcbaf52e5f30e03720ecb14aa"
PKG_LICENSE="GPLv2"
PKG_SITE="https://github.com/libretro/mame2003-plus-libretro"
PKG_URL="https://github.com/libretro/mame2003-plus-libretro/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain retroarch"
PKG_LONGDESC="Updated 2018 version of MAME (0.78) for libretro. with added game support plus many fixes and improvements"

PKG_LIBNAME="mame2003_plus_libretro.so"
PKG_LIBPATH="$PKG_LIBNAME"

configure_target() {
  export LD="$CC"
}

make_target() {
  make GIT_VERSION=${PKG_VERSION:0:7}
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/lib/libretro
  cp $PKG_LIBPATH $INSTALL/usr/lib/libretro/
}
