# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="lr-scummvm"
PKG_VERSION="7fb4d42ca053d8a2e4b9a21ac185226f37568522"
PKG_SHA256="beca3eb4c10733d35ce40a38fe8b38e756b70e81144827e0e0309fdd9d9df711"
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
