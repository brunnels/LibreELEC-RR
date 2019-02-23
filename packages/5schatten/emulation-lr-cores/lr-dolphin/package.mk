# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="lr-dolphin"
PKG_VERSION="6fc594155829e72f7ee3783f809383da9584185d"
PKG_SHA256="e0318d8a821ccc3e32317dfda9b8d9c7ad200f7bc4f4017543aa30e652abd9ed"
PKG_ARCH="x86_64"
PKG_LICENSE="GPLv2"
PKG_SITE="https://github.com/libretro/dolphin"
PKG_URL="https://github.com/libretro/dolphin/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain linux glibc systemd mesa xorg-server enet bluez lzo alsa-lib ffmpeg curl libpng zlib"
PKG_LONGDESC="Dolphin is a GameCube / Wii emulator, allowing you to play games for these two platforms on PC with improvements."

PKG_LIBNAME="dolphin_libretro.so"
PKG_LIBPATH="$PKG_LIBNAME"

pre_configure_target() {
  PKG_CMAKE_OPTS_TARGET="-DENABLE_QT=OFF \
                         -DENABLE_LTO=OFF \
                         -DLIBRETRO=ON \
                         -DENABLE_ANALYTICS=OFF"
}

pre_make_target() {
  # fix cross compiling
  find $PKG_BUILD -name flags.make -exec sed -i "s:isystem :I:g" \{} \;
  find $PKG_BUILD -name build.ninja -exec sed -i "s:isystem :I:g" \{} \;
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/lib/libretro
  cp $PKG_LIBPATH $INSTALL/usr/lib/libretro/
}
