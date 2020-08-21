# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2019-present Frank Hartung (supervisedthinking (@) gmail.com)

PKG_NAME="RPCS3"
PKG_VERSION="305a5bd717c75dd15505154119550620b0d394d5" # v0.0.7+
PKG_ARCH="x86_64"
PKG_LICENSE="GPLv2"
PKG_SITE="https://rpcs3.net"
PKG_URL="https://github.com/RPCS3/rpcs3.git"
PKG_DEPENDS_TARGET="toolchain linux glibc systemd pulseaudio llvm mesa openal-soft-system libevdev curl ffmpeg libpng zlib vulkan-loader glew-cmake libSM enet qt-everywhere unclutter-xfixes"
PKG_LONGDESC="RPCS3 is an experimental open-source Sony PlayStation 3 emulator and debugger."
GET_HANDLER_SUPPORT="git"

PKG_CMAKE_OPTS_TARGET="-D USE_NATIVE_INSTRUCTIONS=off \
                       -D BUILD_LLVM_SUBMODULE=off \
                       -D USE_DISCORD_RPC=off \
                       -D CMAKE_SKIP_RPATH=on \
                       -D USE_SYSTEM_FFMPEG=on \
                       -D USE_SYSTEM_LIBPNG=on \
                       -D USE_SYSTEM_ZLIB=on"

pre_make_target() {
  # fix cross compiling
  find ${PKG_BUILD} -name flags.make -exec sed -i "s:isystem :I:g" \{} \;
  find ${PKG_BUILD} -name build.ninja -exec sed -i "s:isystem :I:g" \{} \;
}

post_makeinstall_target() {
  # Copy scripts
  mkdir -p ${INSTALL}/usr/config/rpcs3
   cp ${PKG_DIR}/scripts/* ${INSTALL}/usr/bin/
   cp -PR ${PKG_DIR}/config/* ${INSTALL}/usr/config/rpcs3/
  
  # Clean up
  safe_remove ${INSTALL}/usr/share/applications
  safe_remove ${INSTALL}/usr/share/icons
  safe_remove ${INSTALL}/usr/share/metainfo
}
