# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="lr-gambatte"
PKG_VERSION="7722012"
PKG_SHA256="c964bd5b9e3c7db4d605f8332f5a8285e6bf1953294ab1ab439cbce534fc13c9"
PKG_ARCH="any"
PKG_LICENSE="GPLv2"
PKG_SITE="https://github.com/libretro/gambatte-libretro"
PKG_URL="https://github.com/libretro/gambatte-libretro/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain retroarch"
PKG_SECTION="emulation"
PKG_LONGDESC="Gambatte is an accuracy-focused, open-source, cross-platform Game Boy Color emulator written in C++."

PKG_LIBNAME="gambatte_libretro.so"
PKG_LIBPATH="$PKG_LIBNAME"

makeinstall_target() {
    mkdir -p $INSTALL/usr/lib/libretro
    cp $PKG_LIBPATH $INSTALL/usr/lib/libretro/
}
