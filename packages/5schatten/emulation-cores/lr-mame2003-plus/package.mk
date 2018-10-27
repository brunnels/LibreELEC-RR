# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 0riginally created by Escalade (https://github.com/escalade)
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="lr-mame2003-plus"
PKG_VERSION="111249e3a860f62f570d73015a32831fcda65d06"
PKG_SHA256="4e4d066468792f631bad2167a006bf95dd76949e696705e0c45391f5bab340c4"
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
  make GIT_VERSION=$PKG_VERSION
}

makeinstall_target() {
    mkdir -p $INSTALL/usr/lib/libretro
    cp $PKG_LIBPATH $INSTALL/usr/lib/libretro/
}
