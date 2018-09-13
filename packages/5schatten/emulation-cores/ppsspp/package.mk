# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="ppsspp"
PKG_VERSION="fd6c314"
PKG_ARCH="any"
PKG_LICENSE="GPLv2"
PKG_SITE="https://github.com/hrydgard/ppsspp"
PKG_URL="https://github.com/hrydgard/ppsspp.git"
PKG_DEPENDS_TARGET="toolchain"
PKG_SECTION="emulation"
PKG_SHORTDESC="A PSP emulator for Android, Windows, Mac, Linux and Blackberry 10, written in C++."
PKG_LONGDESC="A PSP emulator for Android, Windows, Mac, Linux and Blackberry 10, written in C++."
GET_HANDLER_SUPPORT="git"
PKG_TOOLCHAIN="cmake-make"

PKG_LIBNAME="ppsspp_libretro.so"
PKG_LIBPATH="lib/$PKG_LIBNAME"
PKG_LIBVAR="PPSSPP_LIB"

if [ "$PROJECT" == "Amlogic" ] || [ "$PROJECT" == "RPi" ]; then
  case $DEVICE in
     KVIM|RPi2|S905)
      ARCH_ARM="-DARMV7=ON \
                -DUSING_FBDEV=ON \
                -DUSING_EGL=ON \
                -DUSING_GLES2=ON \
                -DUSING_X11_VULKAN=OFF"
     ;;
  esac
fi

PKG_CMAKE_OPTS_TARGET="-DLIBRETRO=ON \
                       -DUSE_SYSTEM_FFMPEG=ON \
                       $ARCH_ARM"

pre_make_target() {
  find . -name flags.make -exec sed -i "s:isystem :I:g" \{} \;
}

makeinstall_target() {
  if [ ! "$OEM_EMU" = "no" ]; then
    mkdir -p $INSTALL/usr/lib/libretro
    cp $PKG_LIBPATH $INSTALL/usr/lib/libretro/
  fi
}
