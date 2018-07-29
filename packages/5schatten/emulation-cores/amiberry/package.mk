# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="amiberry"
PKG_VERSION="ea3908c"
PKG_ARCH="any"
PKG_LICENSE="GPLv3"
PKG_SITE="https://github.com/midwan/amiberry"
PKG_URL="https://github.com/midwan/amiberry.git"
PKG_DEPENDS_TARGET="toolchain zlib SDL2 SDL2_image SDL2_ttf libxml2 flac mpg123 libpng libmpeg2"
PKG_SECTION="emulation"
PKG_SHORTDESC="Amiga emulator for the Raspberry Pi and other ARM SoC"
GET_HANDLER_SUPPORT="git"
PKG_TOOLCHAIN="manual"

make_target() {

  #build capsimg.so
  cd capsimg
  ./bootstrap
  ./configure $options --host=$TARGET_NAME
  make -j 4
  cd ..
  
  #build amiberry
  export SYSROOT_PREFIX=$SYSROOT_PREFIX

  if [ "$DEVICE" = "RPi" ]; then
       make all PLATFORM=rpi1-sdl2
     elif [ "$DEVICE" = "RPi2" ]; then
       make all PLATFORM=rpi2-sdl2
  fi
}

makeinstall_target() {

  #create directories
  mkdir -p $INSTALL/usr/bin
  mkdir -p $INSTALL/usr/lib
  mkdir -p $INSTALL/usr/config/amiberry

  #copy ressources
  cp -R $PKG_DIR/config/* $INSTALL/usr/config/amiberry
  cp -R data $INSTALL/usr/config/amiberry/
  ln -s /storage/roms/bios $INSTALL/usr/config/amiberry/kickstarts
  cp -R savestates $INSTALL/usr/config/amiberry/
  cp -R screenshots $INSTALL/usr/config/amiberry/
  cp -R whdboot $INSTALL/usr/config/amiberry/

  #copy binary, scripts & lib
  cp amiberry-rpi?-sdl2 $INSTALL/usr/bin/amiberry
  cp $PKG_DIR/scripts/* $INSTALL/usr/bin
  cp capsimg/capsimg.so $INSTALL/usr/lib
}
