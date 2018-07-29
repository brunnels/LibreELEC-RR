# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 0riginally created by Escalade (https://github.com/escalade)
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="dosbox-sdl2"
PKG_VERSION="8f8d0c5"
PKG_SHA256="8afd7946cedda8a2ca719fd5e70897b44153bb03a721d394bbfdca28a63d582d"
PKG_ARCH="any"
PKG_LICENSE="GPLv3"
PKG_SITE="https://github.com/duganchen/dosbox"
PKG_URL="https://github.com/duganchen/dosbox/archive/$PKG_VERSION.tar.gz"
PKG_SOURCE_DIR="dosbox-$PKG_VERSION*"
PKG_DEPENDS_TARGET="toolchain alsa-lib SDL2 SDL2_net SDL_sound fluidsynth libpng munt"
PKG_SECTION="emulation"
PKG_SHORTDESC="DOSBox emulator SDL2 fork by duganchen"
PKG_TOOLCHAIN="autotools"

if [ "$PROJECT" = "Generic" ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET glew"
fi

PKG_CONFIGURE_OPTS_TARGET="--prefix=/usr \
                           --enable-core-inline \
                           --enable-dynrec \
                           --enable-unaligned_memory \
                           --with-sdl-prefix=$SYSROOT_PREFIX/usr"

pre_configure_target () {
  cd ..
  rm -rf .$TARGET_NAME
}

pre_make_target() {
  if [[ "$PROJECT" =~ "RPi" ]]; then
    sed -i s/C_TARGETCPU.*/C_TARGETCPU\ ARMV7LE/g config.h
  fi
  sed -i s/SVN/SDL2/g config.h
}

post_makeinstall_target() {
  cp $PKG_DIR/scripts/* $INSTALL/usr/bin/
  mkdir -p $INSTALL/usr/config/dosbox
  cp $PKG_DIR/config/dosbox-SDL2.conf $INSTALL/usr/config/dosbox/
  mkdir -p $INSTALL/usr/config/dosbox/shaders
  wget -q https://github.com/duganchen/dosbox_shaders/archive/master.zip
  unzip -j master.zip -d $INSTALL/usr/config/dosbox/shaders
}
