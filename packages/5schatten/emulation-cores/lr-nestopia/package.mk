# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="lr-nestopia"
PKG_VERSION="69d0ca1"
PKG_SHA256="e46fb72930190a9673f74a45ec65851314b892cadb3a7b233515bf03070bc6f0"
PKG_LICENSE="GPLv2"
PKG_SITE="https://github.com/libretro/nestopia"
PKG_URL="https://github.com/libretro/nestopia/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain retroarch"
PKG_LONGDESC="This project is a fork of the original Nestopia source code, plus the Linux port. The purpose of the project is to enhance the original, and ensure it continues to work on modern operating systems."
PKG_TOOLCHAIN="manual"

PKG_LIBNAME="nestopia_libretro.so"
PKG_LIBPATH="libretro/$PKG_LIBNAME"

post_unpack() {
  rm $PKG_BUILD/configure.ac
}

make_target() {

  if [ "$PROJECT" == "RPi" ]; then
    make -C libretro platform=rpi2
  else
    make -C libretro
  fi
}

makeinstall_target() {
    mkdir -p $INSTALL/usr/lib/libretro
    cp $PKG_LIBPATH $INSTALL/usr/lib/libretro/
}
