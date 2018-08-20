# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="libretro-ishiiruka"
PKG_VERSION="da73ee5"
PKG_SHA256="5f893e8548b31c983f07f906fd44041f2679f06563073fb57f7d7595a5719c5b"
PKG_ARCH="x86_64"
PKG_LICENSE="GPLv2"
PKG_SITE="https://github.com/libretro/Ishiiruka"
PKG_URL="https://github.com/libretro/Ishiiruka/archive/$PKG_VERSION.tar.gz"
PKG_SOURCE_DIR="Ishiiruka-$PKG_VERSION*"
PKG_DEPENDS_TARGET="toolchain kodi-platform enet bluez lzo alsa-lib ffmpeg curl libpng zlib"
PKG_SECTION="emulation"
PKG_SHORTDESC="Dolphin is a GameCube / Wii emulator, allowing you to play games for these two platforms on PC"
PKG_LONGDESC="Dolphin is a GameCube / Wii emulator, allowing you to play games for these two platforms on PC"
PKG_TOOLCHAIN="cmake-make"

PKG_LIBNAME="ishiiruka_libretro.so"
PKG_LIBPATH="Binaries/$PKG_LIBNAME"
PKG_LIBVAR="ISHIIRUKA_LIB"

PKG_CMAKE_OPTS_TARGET="-DENABLE_QT2=OFF \
                       -DENABLE_WX=OFF \
                       -DENABLE_LTO=OFF \
                       -DLIBRETRO=ON \
                       -DENABLE_ANALYTICS=OFF"

pre_make_target() {
  find . -name flags.make -exec sed -i "s:isystem :I:g" \{} \;
}

makeinstall_target() {
  if [ ! "$OEM_EMU" = "no" ]; then
    mkdir -p $INSTALL/usr/lib/libretro
    cp $PKG_LIBPATH $INSTALL/usr/lib/libretro/
  fi
}
