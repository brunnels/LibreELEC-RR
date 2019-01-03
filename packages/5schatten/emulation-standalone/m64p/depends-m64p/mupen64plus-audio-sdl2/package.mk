# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="mupen64plus-audio-sdl2"
PKG_VERSION="1d9ac5f6ac52658d0713a342f2e62090ca261b0a"
PKG_SHA256="adda693b4343d9305174520027fa0b33a2311a815df48bdf19a08f228d0e2a41"
PKG_LICENSE="GPLv2"
PKG_SITE="https://github.com/m64p/mupen64plus-audio-sdl2"
PKG_URL="https://github.com/m64p/mupen64plus-audio-sdl2/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain mupen64plus-core SDL2-git"
PKG_LONGDESC="A low-level N64 video emulation plugin, based on the pixel-perfect angrylion RDP plugin with some improvements."
PKG_TOOLCHAIN="manual"

configure_target() {
  export SYSROOT_PREFIX=$SYSROOT_PREFIX
}

make_target() {
  cd $PKG_BUILD/projects/unix
  make -j$CONCURRENCY_MAKE_LEVEL all APIDIR=$(get_build_dir mupen64plus-core)/src/api
}
