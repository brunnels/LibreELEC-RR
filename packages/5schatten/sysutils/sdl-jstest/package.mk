# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 0riginally created by Escalade (https://github.com/escalade)
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="sdl-jstest"
PKG_VERSION="34042f6"
PKG_SHA256="054dcd5a673147c6119b93910040fe8556839f3af6060ffabf882753f9464eaa"
PKG_ARCH="any"
PKG_LICENSE="GPLv2"
PKG_SITE="https://github.com/Grumbel/sdl-jstest"
PKG_URL="https://github.com/Grumbel/sdl-jstest/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain cmake:host SDL2 ncurses"
PKG_SECTION="emulation/sysutils"
PKG_SHORTDESC="sdl2-jstest are simple programs that lets you find out how many joysticks SDL2 detects on your system, how many axes, buttons, hats and balls they have each."

post_makeinstall_target() {
 ln -sf sdl2-jstest $INSTALL/usr/bin/sdl-jstest
}
