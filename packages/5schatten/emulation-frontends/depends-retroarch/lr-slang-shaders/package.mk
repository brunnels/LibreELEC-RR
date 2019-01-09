# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="lr-slang-shaders"
PKG_VERSION="488bcf40383a34cff02d07c4ced3c37e80aead9c"
PKG_SHA256="2e5a928d4cc7b8f3ee26e25561ab04e4aea4b28c169cd7b8d4e1d0d88cd2f1f2"
PKG_LICENSE="MIT"
PKG_SITE="https://github.com/libretro/slang-shaders"
PKG_URL="https://github.com/libretro/slang-shaders/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="Vulkan GLSL RetroArch shader system"
PKG_TOOLCHAIN="manual"

makeinstall_target() {
  cd $PKG_BUILD
  find . -type f -exec chmod 644 {} \;
  cd -
  mkdir -p $INSTALL/usr/share/retroarch/shaders
  cp -R $PKG_BUILD/* $INSTALL/usr/share/retroarch/shaders
  rm -r $INSTALL/usr/share/retroarch/shaders/configure
  rm -r $INSTALL/usr/share/retroarch/shaders/Makefile
  rm -r $INSTALL/usr/share/retroarch/shaders/README.md
}
