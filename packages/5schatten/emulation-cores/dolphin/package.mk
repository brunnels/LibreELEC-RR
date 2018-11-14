# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 0riginally created by Escalade (https://github.com/escalade)
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="dolphin"
PKG_VERSION="6b7a1ca6d182d8d2469618e996bcad5eb091a0bb"
PKG_SHA256="68e710a13f29c5281f54e20992998595b4e8898d40837d6a59be6910705e67af"
PKG_ARCH="x86_64"
PKG_LICENSE="GPLv2"
PKG_SITE="https://github.com/dolphin-emu/dolphin"
PKG_URL="https://github.com/dolphin-emu/dolphin/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain openal-soft libevdev gtk+ ffmpeg zlib bluez pulseaudio alsa-lib libogg libvorbis libSM enet qt-everywhere"
PKG_LONGDESC="Dolphin GameCube/Wii emulator"
PKG_TOOLCHAIN="cmake-make"
PKG_BUILD_FLAGS="-gold"

PKG_CMAKE_OPTS_TARGET="-DENABLE_LTO=off \
                       -DUSE_SHARED_ENET=on \
                       -DUSE_DISCORD_PRESENCE=off \
                       -DENABLE_ANALYTICS=off \
                       -DDISTRIBUTOR=5schatten"

pre_make_target() {
  # Fix stdlib.h error
  find . -name flags.make -exec sed -i "s:isystem :I:g" \{} \;
  
  # Export QT path
  export Qt5Gui_DIR=$SYSROOT_PREFIX/usr/lib

  # Ugly version hack
  PKG_DOLPHIN_RELEASE="5.0-9132"
  PKG_DOLPHIN_BRANCH="Master"
  printf "#define SCM_REV_STR \""$PKG_VERSION"\"\n""#define SCM_DESC_STR \""$PKG_DOLPHIN_RELEASE"\"\n""#define SCM_BRANCH_STR \""$PKG_DOLPHIN_BRANCH"\"\n""#define SCM_IS_MASTER 0\n""#define SCM_DISTRIBUTOR_STR \"None\"\n""#define SCM_UPDATE_TRACK_STR \"\"\n" > Source/Core/Common/scmrev.h
}

post_makeinstall_target() {
  # Copy scripts & config files
  mkdir -p $INSTALL/usr/config/dolphin-emu
  cp $PKG_DIR/scripts/* $INSTALL/usr/bin/
  cp -PR $PKG_DIR/config/* $INSTALL/usr/config/dolphin-emu/

  # Clean up
  rm $INSTALL/usr/bin/dolphin-emu-nogui
  rm -rf $INSTALL/usr/share/applications
  rm -rf $INSTALL/usr/share/icons
}
