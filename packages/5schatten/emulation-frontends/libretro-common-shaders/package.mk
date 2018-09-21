# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="libretro-common-shaders"
PKG_VERSION="3e434c9934f6f19db17a7238c8d2289b4fcf1e93"
PKG_SHA256="c63e5b97fb2f59c992f179e8ad1fd508509a9d94d876bf91a3b1f17cc0e9da64"
PKG_ARCH="any"
PKG_LICENSE="MIT"
PKG_SITE="https://github.com/libretro/common-shaders"
PKG_URL="https://github.com/libretro/common-shaders/archive/$PKG_VERSION.tar.gz"
PKG_SOURCE_DIR="common-shaders-$PKG_VERSION*"
PKG_DEPENDS_TARGET="toolchain"
PKG_SECTION="emulation"
PKG_SHORTDESC="Collection of commonly used Cg shaders. These shaders are usable by either HLSL and/or Cg runtime compilers. The cg2glsl script will translate most of these into GLSL shaders."
PKG_TOOLCHAIN="manual"

makeinstall_target() {
  cd $PKG_BUILD
  find . -type f -exec chmod 644 {} \;
  cd -
  mkdir -p $INSTALL/usr/share/retroarch/shaders
  cp -R $PKG_BUILD/* $INSTALL/usr/share/retroarch/shaders
  rm -r $INSTALL/usr/share/retroarch/shaders/configure
  rm -r $INSTALL/usr/share/retroarch/shaders/Makefile
}
