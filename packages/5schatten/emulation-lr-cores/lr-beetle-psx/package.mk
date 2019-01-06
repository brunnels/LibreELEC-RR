# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="lr-beetle-psx"
PKG_VERSION="c20eac9a7554dd5fa6e7b191f6db3a7c8449a238"
PKG_SHA256="7d0f24a12f06b0bd9b51b38af6139d95430de93448c45e4bb131c5335a65e89c"
PKG_LICENSE="GPLv2"
PKG_SITE="https://github.com/libretro/beetle-psx-libretro"
PKG_URL="https://github.com/libretro/beetle-psx-libretro/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain retroarch"
PKG_LONGDESC="Standalone port/fork of Mednafen PSX to the Libretro API."

PKG_LIBNAME="mednafen_psx_libretro.so"
PKG_LIBPATH="${PKG_LIBNAME}"

make_target() {
  make GIT_VERSION=${PKG_VERSION:0:7}

  # Build with OpenGL/Vulkan support if available
  if [ "${OPENGL_SUPPORT}" = "yes" ];then
    mkdir -p tmp
    mv ${PKG_LIBNAME} tmp/
    make clean
    if [ "${VULKAN_SUPPORT}" = "yes" ];then
      make HAVE_HW=1 GIT_VERSION=${PKG_VERSION:0:7}
    else
      make HAVE_OPENGL=1 GIT_VERSION=${PKG_VERSION:0:7}
    fi
    mv tmp/${PKG_LIBNAME} .
  fi
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/lib/libretro
  cp mednafen_psx_*libretro.so $INSTALL/usr/lib/libretro/
}
