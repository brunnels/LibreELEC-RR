# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 0riginally created by Escalade (https://github.com/escalade)
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="lr-mame2003-plus"
PKG_VERSION="e6bc0c7683453147835752af333dae6150a8441e"
PKG_SHA256="8b17fa3e17f4faba3333d2f4cc740b6948d20ae3703e01853bc0313855acecab"
PKG_LICENSE="GPLv2"
PKG_SITE="https://github.com/libretro/mame2003-plus-libretro"
PKG_URL="https://github.com/libretro/mame2003-plus-libretro/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain retroarch"
PKG_LONGDESC="Updated 2018 version of MAME (0.78) for libretro. with added game support plus many fixes and improvements"
PKG_TOOLCHAIN="make"

PKG_LIBNAME="mame2003_plus_libretro.so"
PKG_LIBPATH="$PKG_LIBNAME"

PKG_MAKE_OPTS_TARGET="GIT_VERSION=${PKG_VERSION:0:7}"

configure_target() {
  # Set skip Disclaimer to enabled
  sed -e "s/\"Skip Disclaimer; disabled|enabled\"/\"Skip Disclaimer; enabled|disabled\"/" -i ${PKG_BUILD}/src/mame2003/mame2003.c
  export LD="$CC"
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/lib/libretro
  cp $PKG_LIBPATH $INSTALL/usr/lib/libretro/
}
