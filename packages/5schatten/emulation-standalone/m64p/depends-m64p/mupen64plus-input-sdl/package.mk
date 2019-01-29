# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="mupen64plus-input-sdl"
PKG_VERSION="25c8ffc0c58e9c0d10b43f4f946f23166949ce1d"
PKG_SHA256="3c3aa148e28fd81e1dfe8d19907ed0feee8d88711f9dce4d5eb583070b83ef3a"
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
