# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="lr-slang-shaders"
PKG_VERSION="fa2304804a5443bb1d5c38dfbd80d918ba0ee6db"
PKG_SHA256="f14ca5334f18ba60e95a806cb386b79e06d46ad48e3dd5a12ca06d1ae42fde42"
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
