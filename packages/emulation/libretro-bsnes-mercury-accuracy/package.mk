# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="libretro-bsnes-mercury-accuracy"
PKG_VERSION="4a382621da58ae6da850f1bb003ace8b5f67968c"
PKG_SHA256="9f9989fbda41164647b1d0ea59bab7108b0ad83778f682275e9eb666b07549cc"
PKG_LICENSE="GPLv2"
PKG_SITE="https://github.com/libretro/bsnes-mercury"
PKG_URL="https://github.com/libretro/bsnes-mercury/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain kodi-platform"
PKG_LONGDESC="game.libretro.beetle-bsnes-accuracy: Beetle bSNES for Kodi"

PKG_LIBNAME="bsnes_mercury_accuracy_libretro.so"
PKG_LIBPATH="out/$PKG_LIBNAME"
PKG_LIBVAR="BSNES-MERCURY-ACCURACY_LIB"

make_target() {
  make profile=accuracy
}

makeinstall_target() {
  if [ ! "$OEM_EMU" = "no" ]; then
    mkdir -p $INSTALL/usr/lib/libretro
    cp $PKG_LIBPATH $INSTALL/usr/lib/libretro/
  fi

  mkdir -p $SYSROOT_PREFIX/usr/lib/cmake/$PKG_NAME
  cp $PKG_LIBPATH $SYSROOT_PREFIX/usr/lib/$PKG_LIBNAME
  echo "set($PKG_LIBVAR $SYSROOT_PREFIX/usr/lib/$PKG_LIBNAME)" > $SYSROOT_PREFIX/usr/lib/cmake/$PKG_NAME/$PKG_NAME-config.cmake
}
