# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="libretro-slang-shaders"
PKG_VERSION="d96ecca"
PKG_SHA256="c8b923b0b29cf6d1ef44b6e0b6b32bff1ab454f847a27fcbd67216e2ac421544"
PKG_ARCH="any"
PKG_LICENSE="MIT"
PKG_SITE="https://github.com/libretro/slang-shaders"
PKG_URL="https://github.com/libretro/slang-shaders/archive/$PKG_VERSION.tar.gz"
PKG_SOURCE_DIR="slang-shaders-$PKG_VERSION*"
PKG_DEPENDS_TARGET="toolchain"
PKG_SECTION="emulation"
PKG_SHORTDESC="Vulkan GLSL RetroArch shader system"
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
