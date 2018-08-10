# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="libretro-slang-shaders"
PKG_VERSION="9a3bc3a"
PKG_SHA256="4e0d4b5efedb5b01a296381495e14f3553162de503d105723eed51b8972b85f8"
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
