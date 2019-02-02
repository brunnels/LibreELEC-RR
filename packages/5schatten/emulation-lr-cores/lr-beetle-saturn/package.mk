# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="lr-beetle-saturn"
PKG_VERSION="564a1463c082d9f7cdf9c95a1746b4077c5e4ffb"
PKG_SHA256="28bbb202fe68997dcdbf4232c25b908aca33895de9a4ae9d6983cc898e16eb9c"
PKG_LICENSE="GPLv3"
PKG_SITE="https://github.com/libretro/beetle-saturn-libretro"
PKG_URL="https://github.com/libretro/beetle-saturn-libretro/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain retroarch"
PKG_LONGDESC="Standalone port of Mednafen Saturn to the libretro API."
PKG_TOOLCHAIN="make"

PKG_LIBNAME="mednafen_saturn_libretro.so"
PKG_LIBPATH="$PKG_LIBNAME"

PKG_MAKE_OPTS_TARGET="GIT_VERSION=${PKG_VERSION:0:7}"

makeinstall_target() {
  mkdir -p $INSTALL/usr/lib/libretro
  cp $PKG_LIBPATH $INSTALL/usr/lib/libretro/
}
