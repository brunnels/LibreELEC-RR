# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="mupen64plus-gui"
PKG_VERSION="3bf730a473bef77f7b6c64586a1fc2eb064243eb"
PKG_SHA256="a27bf345db3448adaebd50cb949063fd3d88549c4911e5b69adfe261264cbddf"
PKG_LICENSE="GPLv3"
PKG_SITE="https://github.com/m64p/mupen64plus-gui"
PKG_URL="https://github.com/m64p/mupen64plus-gui/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain SDL2-git qt-everywhere p7zip-system"
PKG_LONGDESC="mupen64plus GUI written in Qt5"
PKG_TOOLCHAIN="manual"

configure_target() {
  export SYSROOT_PREFIX=$SYSROOT_PREFIX
}

make_target() {
  mkdir -p $PKG_BUILD/.${TARGET_NAME}
  cd .${TARGET_NAME}
  qmake ../mupen64plus-gui.pro
  make -j$CONCURRENCY_MAKE_LEVEL
}
