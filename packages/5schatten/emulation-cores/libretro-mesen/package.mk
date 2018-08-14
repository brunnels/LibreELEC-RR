# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="libretro-mesen"
PKG_VERSION="e72f837"
PKG_SHA256="4b2dd0e19a89963878ed1ee20c6c4a345662dc913afaf3eb56f5ab31c1c44a7e"
PKG_ARCH="any"
PKG_LICENSE="GPLv3"
PKG_SITE="https://github.com/SourMesen/Mesen"
PKG_URL="https://github.com/SourMesen/Mesen/archive/$PKG_VERSION.tar.gz"
PKG_SOURCE_DIR="Mesen-$PKG_VERSION*"
PKG_DEPENDS_TARGET="toolchain kodi-platform"
PKG_SECTION="emulation"
PKG_SHORTDESC="NES/Famicom emulator"
PKG_LONGDESC="Mesen is a cross-platform (Windows & Linux) NES/Famicom emulator built in C++ and C#"
PKG_TOOLCHAIN="manual"

PKG_LIBNAME="mesen_libretro.so"
PKG_LIBPATH="Libretro/$PKG_LIBNAME"
PKG_LIBVAR="MESEN_LIB"

make_target() {
  make -C Libretro
}

makeinstall_target() {
  if [ ! "$OEM_EMU" = "no" ]; then
    mkdir -p $INSTALL/usr/lib/libretro
    cp $PKG_LIBPATH $INSTALL/usr/lib/libretro/
  fi
}
