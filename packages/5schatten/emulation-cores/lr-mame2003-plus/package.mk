# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 0riginally created by Escalade (https://github.com/escalade)
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="lr-mame2003-plus"
PKG_VERSION="d652e7f"
PKG_SHA256="bf1b9608162741c269d1899c4527b7ee1835723cf0a027fc10a9a9f96fe5a4f3"
PKG_ARCH="any"
PKG_LICENSE="GPLv2"
PKG_SITE="https://github.com/libretro/mame2003-plus-libretro"
PKG_URL="https://github.com/libretro/mame2003-plus-libretro/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain retroarch"
PKG_SECTION="emulation"
PKG_LONGDESC="Updated 2018 version of MAME (0.78) for libretro. with added game support plus many fixes and improvements"

PKG_LIBNAME="mame2003_plus_libretro.so"
PKG_LIBPATH="$PKG_LIBNAME"

configure_target() {
  export LD="$CC"
}

make_target() {
  make GIT_VERSION=$PKG_VERSION
}

makeinstall_target() {
    mkdir -p $INSTALL/usr/lib/libretro
    cp $PKG_LIBPATH $INSTALL/usr/lib/libretro/
}
