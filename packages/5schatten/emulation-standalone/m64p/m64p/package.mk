# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="m64p"
PKG_VERSION="1.0"
PKG_SITE="https://m64p.github.io/"
PKG_URL=""
PKG_DEPENDS_TARGET="toolchain mupen64plus-core mupen64plus-rsp-hle mupen64plus-rsp-cxd4 mupen64plus-input-sdl mupen64plus-audio-sdl2 mupen64plus-gui GLideN64 angrylion-rdp-plus"
PKG_LONGDESC="mupen64plus + GLideN64 + a GUI"
PKG_TOOLCHAIN="manual"

makeinstall_target() {
  # Create directories
  mkdir -p $INSTALL/usr/bin
  mkdir -p $INSTALL/usr/config/mupen64plus
  mkdir -p $INSTALL/usr/lib

  # Install binary & scripts
  cp $PKG_DIR/scripts/* $INSTALL/usr/bin
  cp $(get_build_dir mupen64plus-gui)/.${TARGET_NAME}/mupen64plus-gui $INSTALL/usr/bin
  
  # Install config files
  cp $PKG_DIR/config/*                             $INSTALL/usr/config/mupen64plus
  cp $(get_build_dir GLideN64)/ini/*.ini           $INSTALL/usr/config/mupen64plus
  cp $(get_build_dir mupen64plus-core)/data/*      $INSTALL/usr/config/mupen64plus
  cp $(get_build_dir mupen64plus-input-sdl)/data/* $INSTALL/usr/config/mupen64plus

  # Install libs
  cp $(get_build_dir angrylion-rdp-plus)/.${TARGET_NAME}/*.so     $INSTALL/usr/lib
  cp $(get_build_dir GLideN64)/projects/cmake/plugin/Release/*.so $INSTALL/usr/lib
  cp $(get_build_dir mupen64plus-audio-sdl2)/projects/unix/*.so   $INSTALL/usr/lib
  cp -P $(get_build_dir mupen64plus-core)/projects/unix/*.so*     $INSTALL/usr/lib
  cp $(get_build_dir mupen64plus-input-sdl)/projects/unix/*.so    $INSTALL/usr/lib
  cp $(get_build_dir mupen64plus-rsp-cxd4)/projects/unix/*.so     $INSTALL/usr/lib
  cp $(get_build_dir mupen64plus-rsp-hle)/projects/unix/*.so      $INSTALL/usr/lib
}
