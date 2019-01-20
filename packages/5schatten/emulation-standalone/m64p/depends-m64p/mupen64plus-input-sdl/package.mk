# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="mupen64plus-input-sdl"
PKG_VERSION="cab01d8f6c73153cead6f03df457d3bb15be2e5e"
PKG_SHA256="646186c2582426f447c5d15c39573b36da61e60d90950ec13c223f4cc15363ee"
PKG_LICENSE="GPLv2"
PKG_SITE="https://github.com/mupen64plus/mupen64plus-input-sdl"
PKG_URL="https://github.com/mupen64plus/mupen64plus-input-sdl/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain SDL2-git mupen64plus-core"
PKG_LONGDESC="Input plugin for Mupen64Plus v2.0 project using SDL. This is derived from the original Mupen64 blight_input plugin."
PKG_TOOLCHAIN="make"

PKG_MAKE_OPTS_TARGET="-f projects/unix/Makefile SRCDIR=src APIDIR=$(get_build_dir mupen64plus-core)/src/api all"

pre_configure_target() {
  export SYSROOT_PREFIX=$SYSROOT_PREFIX
}

makeinstall_target() {
 :
}
