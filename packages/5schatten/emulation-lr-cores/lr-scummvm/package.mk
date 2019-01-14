# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="lr-scummvm"
PKG_VERSION="d6fb141ed00c70fd84cf78386e88c244265a14f1"
PKG_SHA256="1f37fa2458be8a161848506246dcaf39fc587ee1fd786c50cfb69a3524c22ba4"
PKG_LICENSE="GPLv3"
PKG_SITE="https://github.com/libretro/scummvm"
PKG_URL="https://github.com/libretro/scummvm/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain retroarch"
PKG_LONGDESC="ScummVM is an interpreter for point-and-click adventure games that can be used as a libretro core."
PKG_TOOLCHAIN="make"

PKG_LIBNAME="scummvm_libretro.so"
PKG_LIBPATH="backends/platform/libretro/build/$PKG_LIBNAME"

PKG_MAKE_OPTS_TARGET="-C backends/platform/libretro/build/ GIT_VERSION=${PKG_VERSION:0:7}"

pre_make_target() {
  cd $PKG_BUILD
  CXXFLAGS+=" -DHAVE_POSIX_MEMALIGN=1"
  export AR+=" cru"
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/lib/libretro
  cp $PKG_LIBPATH $INSTALL/usr/lib/libretro/
}
