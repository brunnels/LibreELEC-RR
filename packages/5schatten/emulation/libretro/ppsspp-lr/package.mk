# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2018-present Frank Hartung (supervisedthinking (@) gmail.com)

PKG_NAME="ppsspp-lr"
PKG_VERSION="528d04defeab67e1a7d307a6c97130d40845b358" #v1.8.0+
PKG_LICENSE="GPLv2"
PKG_SITE="https://github.com/hrydgard/ppsspp"
PKG_URL="https://github.com/hrydgard/ppsspp.git"
PKG_DEPENDS_TARGET="toolchain linux glibc SDL2-git zlib ffmpeg bzip2 openssl speex"
PKG_LONGDESC="A PSP emulator for Android, Windows, Mac, Linux and Blackberry 10, written in C++."
GET_HANDLER_SUPPORT="git"
PKG_BUILD_FLAGS="+lto"

PKG_LIBNAME="ppsspp_libretro.so"
PKG_LIBPATH="lib/${PKG_LIBNAME}"

configure_package() {
  # Displayserver Support
  if [ "${DISPLAYSERVER}" = "x11" ]; then
    PKG_DEPENDS_TARGET+=" xorg-server"
  fi

  # OpenGL Support
  if [ "${OPENGL_SUPPORT}" = "yes" ]; then
    PKG_DEPENDS_TARGET+=" ${OPENGL}"
  fi

  # OpenGLES Support
  if [ "${OPENGLES_SUPPORT}" = "yes" ]; then
    PKG_DEPENDS_TARGET+=" ${OPENGLES}"
  fi
}

pre_configure_target() {
  PKG_CMAKE_OPTS_TARGET="-DLIBRETRO=ON \
                         -DUSE_SYSTEM_FFMPEG=ON \
                         -DUSING_X11_VULKAN=OFF \
                         -DUSE_DISCORD=OFF"

  if [ "${ARCH}" = "arm" ] && [ ! "${TARGET_CPU}" = "arm1176jzf-s" ]; then
    PKG_CMAKE_OPTS_TARGET+=" -DARMV7=ON"
  elif [ "${TARGET_CPU}" = "arm1176jzf-s" ]; then
    PKG_CMAKE_OPTS_TARGET+=" -DARM=ON"
  fi

  if [ "${OPENGLES_SUPPORT}" = "yes" ]; then
    PKG_CMAKE_OPTS_TARGET+=" -DUSING_FBDEV=ON \
                             -DUSING_EGL=ON \
                             -DUSING_GLES2=ON"
  fi
}

pre_make_target() {
  # fix cross compiling
  find ${PKG_BUILD} -name flags.make -exec sed -i "s:isystem :I:g" \{} \;
  find ${PKG_BUILD} -name build.ninja -exec sed -i "s:isystem :I:g" \{} \;
}

makeinstall_target() {
  mkdir -p ${INSTALL}/usr/lib/libretro
  cp -v ${PKG_LIBPATH} ${INSTALL}/usr/lib/libretro/
}
