# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 0riginally created by Escalade (https://github.com/escalade)
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="dolphin"
PKG_VERSION="84794a6f0cdfc63a957b5bb8dd887a0ea30dd4f7"
PKG_SHA256="131f5035e63c3188883330f0729b99d3eba8e0024e330acf598cac51a710dde6"
PKG_DOLPHIN_RELEASE="5.0-9462"
PKG_ARCH="x86_64"
PKG_LICENSE="GPLv2"
PKG_SITE="https://github.com/dolphin-emu/dolphin"
PKG_URL="https://github.com/dolphin-emu/dolphin/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain openal-soft libevdev gtk+ ffmpeg zlib bluez pulseaudio alsa-lib libogg libvorbis libSM enet qt-everywhere"
PKG_LONGDESC="Dolphin is a GameCube / Wii emulator, allowing you to play games for these two platforms on PC with improvements."

PKG_CMAKE_OPTS_TARGET="-DENABLE_LTO=off \
                       -DUSE_SHARED_ENET=on \
                       -DUSE_DISCORD_PRESENCE=off \
                       -DENABLE_ANALYTICS=off \
                       -DDISTRIBUTOR=5schatten"

pre_make_target() {
  # fix cross compiling
  find $PKG_BUILD -name flags.make -exec sed -i "s:isystem :I:g" \{} \;
  find $PKG_BUILD -name build.ninja -exec sed -i "s:isystem :I:g" \{} \;
  
  # Export QT path
  export Qt5Gui_DIR=$SYSROOT_PREFIX/usr/lib

  # Export Dolphin revision
  PKG_DOLPHIN_BRANCH="Master"
  PKG_DOLPHIN_DISTRI="5schatten"
  PKG_DOLPHIN_REV_H=Source/Core/Common/scmrev.h

  echo "#define SCM_REV_STR" ""\"${PKG_VERSION}""\"                >  ${PKG_DOLPHIN_REV_H}
  echo "#define SCM_DESC_STR" ""\"${PKG_DOLPHIN_RELEASE}""\"       >> ${PKG_DOLPHIN_REV_H}
  echo "#define SCM_BRANCH_STR" ""\"$PKG_DOLPHIN_BRANCH""\"        >> ${PKG_DOLPHIN_REV_H}
  echo "#define SCM_IS_MASTER 0"                                   >> ${PKG_DOLPHIN_REV_H}
  echo "#define SCM_DISTRIBUTOR_STR" ""\"${PKG_DOLPHIN_DISTRI}""\" >> ${PKG_DOLPHIN_REV_H}
  echo "#define SCM_UPDATE_TRACK_STR" ""\"\"                       >> ${PKG_DOLPHIN_REV_H}
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
