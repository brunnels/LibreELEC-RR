# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="fluidsynth-git"
PKG_VERSION="2.0.3"
PKG_SHA256="12c7ede220f54a6e52a7e7b0b1729c04a4282685569adf18d932a7dd3c10e759"
PKG_LICENSE="LGPL"
PKG_SITE="http://fluidsynth.org/"
PKG_URL="https://github.com/FluidSynth/fluidsynth/archive/v$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain glib soundfont-generaluser"
PKG_LONGDESC="FluidSynth is a software real-time synthesizer based on the Soundfont 2 specifications."
PKG_BUILD_FLAGS="+pic"

pre_configure_target() {
  PKG_CMAKE_OPTS_TARGET="-Denable-readline=0 \
                         -Denable-oss=0 \
                         -Denable-pulseaudio=1 \
                         -Denable-libsndfile=0"
}

post_makeinstall_target() {
  # Create directories
  mkdir -p $INSTALL/etc/fluidsynth
  mkdir -p $INSTALL/usr/config/fluidsynth/soundfonts

  # Create symlinks & install config file
  cp $PKG_DIR/config/* $INSTALL/usr/config/fluidsynth/
  ln -s /storage/.config/fluidsynth/fluidsynth.conf $INSTALL/etc/fluidsynth/
  echo "Place your SoundFonts here!" >> $INSTALL/usr/config/fluidsynth/soundfonts/readme.txt

  # Create symlink to SoundFont
  ln -s /usr/share/soundfonts/GeneralUser.sf2  $INSTALL/usr/config/fluidsynth/soundfonts/
}
