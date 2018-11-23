# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="lr-fceumm"
PKG_VERSION="ef60a38ef3a8fdb1bdf671e5df84ba97ff0c2220"
PKG_SHA256="f3b0b2ce464aa595dafba880d9da2d68d6ac7b38c07edf33ae26c977c234be6a"
PKG_LICENSE="GPLv2"
PKG_SITE="https://github.com/libretro/libretro-fceumm"
PKG_URL="https://github.com/libretro/libretro-fceumm/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain retroarch"
PKG_LONGDESC="FCEU mappers modified is an unofficial build of FCEU Ultra by CaH4e3, which supports a lot of new mappers including some obscure mappers such as one for unlicensed NES ROM's."

PKG_LIBNAME="fceumm_libretro.so"
PKG_LIBPATH="$PKG_LIBNAME"

make_target() {
  make -f Makefile.libretro GIT_VERSION=${PKG_VERSION:0:7}
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/lib/libretro
  cp $PKG_LIBPATH $INSTALL/usr/lib/libretro/
}
