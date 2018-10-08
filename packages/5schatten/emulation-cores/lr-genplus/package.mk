# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="lr-genplus"
PKG_VERSION="7856b72"
PKG_SHA256="bb7253623488e57b6e852135c7fedce693fd997a6cb8abb2309c20886ee6aed8"
PKG_ARCH="any"
PKG_LICENSE="Modified BSD / LGPLv2.1"
PKG_SITE="https://github.com/libretro/Genesis-Plus-GX"
PKG_URL="https://github.com/libretro/Genesis-Plus-GX/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain retroarch"
PKG_SECTION="emulation"
PKG_LONGDESC="An enhanced port of Genesis Plus - accurate & portable Sega 8/16 bit emulator"
PKG_TOOLCHAIN="manual"

PKG_LIBNAME="genesis_plus_gx_libretro.so"
PKG_LIBPATH="$PKG_LIBNAME"

make_target() {
  if [ "$ARCH" == "arm" ]; then
    CFLAGS="$CFLAGS -DALIGN_LONG"
  fi

  make -f Makefile.libretro GIT_VERSION=$PKG_VERSION
}

makeinstall_target() {
    mkdir -p $INSTALL/usr/lib/libretro
    cp $PKG_LIBPATH $INSTALL/usr/lib/libretro/
}
