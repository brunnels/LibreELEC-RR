# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 0riginally created by Escalade (https://github.com/escalade)
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="sdl-jstest"
PKG_VERSION="53b89cc2" #v0.2.1
PKG_ARCH="any"
PKG_LICENSE="GPLv2"
PKG_SITE="https://gitlab.com/sdl-jstest/sdl-jstest"
PKG_URL="https://gitlab.com/sdl-jstest/sdl-jstest.git"
PKG_SOURCE_DIR="$PKG_NAME-*$PKG_VERSION*"
PKG_DEPENDS_TARGET="toolchain cmake:host SDL2 ncurses"
PKG_SECTION="emulation/sysutils"
PKG_SHORTDESC="sdl2-jstest are simple programs that lets you find out how many joysticks SDL2 detects on your system, how many axes, buttons, hats and balls they have each."
GET_HANDLER_SUPPORT="git"

PKG_CMAKE_OPTS_TARGET="-DBUILD_SDL_JSTEST=off"

post_makeinstall_target() {
 ln -sf sdl2-jstest $INSTALL/usr/bin/sdl-jstest
}
