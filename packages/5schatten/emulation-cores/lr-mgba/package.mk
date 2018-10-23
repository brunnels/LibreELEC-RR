# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="lr-mgba"
PKG_VERSION="0a79981"
PKG_SHA256="f6171ee6b5459de8eca30231c6fcacdfd94e7375508e347042714a668aa8970d"
PKG_LICENSE="MPL 2.0"
PKG_SITE="https://github.com/libretro/mgba"
PKG_URL="https://github.com/libretro/mgba/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain retroarch"
PKG_LONGDESC="mGBA is an emulator for running Game Boy Advance games. It aims to be faster and more accurate than many existing Game Boy Advance emulators, as well as adding features that other emulators lack."
PKG_TOOLCHAIN="manual"

PKG_LIBNAME="mgba_libretro.so"
PKG_LIBPATH="$PKG_LIBNAME"

pre_configure_target() {
  # fails to build in subdirs
  cd $PKG_BUILD
  rm -rf .$TARGET_NAME
}

make_target() {
  if [ "$PROJECT" == "Amlogic" ]; then
      make -f Makefile.libretro platform=unix-armv HAVE_NEON=1 GIT_VERSION=$PKG_VERSION
  fi

  if [ "$PROJECT" == "Generic" ]; then
      make -f Makefile.libretro GIT_VERSION=$PKG_VERSION
  fi

  if [ "$PROJECT" == "RPi" ]; then
    case $DEVICE in
      RPi)
      make -f Makefile.libretro platform=unix-armv HAVE_NEON=1 GIT_VERSION=$PKG_VERSION
        ;;
      RPi2)
      make -f Makefile.libretro platform=unix-armv CC=$CC CXX=$CXX GIT_VERSION=$PKG_VERSION
        ;;
    esac
  fi
}

makeinstall_target() {
    mkdir -p $INSTALL/usr/lib/libretro
    cp $PKG_LIBPATH $INSTALL/usr/lib/libretro/
}
