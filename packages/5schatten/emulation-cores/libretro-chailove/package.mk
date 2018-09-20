# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="libretro-chailove"
PKG_VERSION="14a66ea"
PKG_ARCH="any"
PKG_LICENSE="MIT"
PKG_SITE="https://github.com/libretro/libretro-chailove"
PKG_URL="https://github.com/libretro/libretro-chailove.git"
PKG_DEPENDS_TARGET="toolchain"
PKG_SECTION="emulation"
PKG_LONGDESC="ChaiLove is an awesome framework you can use to make 2D games in ChaiScript."
GET_HANDLER_SUPPORT="git"
PKG_TOOLCHAIN="manual"

PKG_LIBNAME="chailove_libretro.so"
PKG_LIBPATH="$PKG_LIBNAME"
PKG_LIBVAR="CHAILOVE_LIB"

configure_target() {
  cd $PKG_BUILD
}

make_target() {
  make
}

makeinstall_target() {
  if [ "$OEM_EMU" == "yes" ]; then
    mkdir -p $INSTALL/usr/lib/libretro
    cp $PKG_LIBPATH $INSTALL/usr/lib/libretro/
  fi
}
