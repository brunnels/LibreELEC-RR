# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2018-present Frank Hartung (supervisedthinking (@) gmail.com)

PKG_NAME="beetle-psx"
PKG_VERSION="f55db8655408104a6e20af667657423f08566c85"
PKG_SHA256="a8afc13683da37c5fd43c322b257ddde7b953a3eb36905c3173e8019f88259dd"
PKG_LICENSE="GPLv2"
PKG_SITE="https://github.com/libretro/beetle-psx-libretro"
PKG_URL="https://github.com/libretro/beetle-psx-libretro/archive/${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain linux glibc"
PKG_LONGDESC="Standalone port/fork of Mednafen PSX to the Libretro API."
PKG_BUILD_FLAGS="+lto"

PKG_LIBNAME="mednafen_psx_*libretro.so"
PKG_LIBPATH="${PKG_LIBNAME}"

configure_package() {
  # Displayserver Support
  if [ "${DISPLAYSERVER}" = "x11" ]; then
    PKG_DEPENDS_TARGET+=" xorg-server"
  fi

  # OpenGL Support
  if [ "${OPENGL_SUPPORT}" = "yes" ]; then
    PKG_DEPENDS_TARGET+=" ${OPENGL}"
  fi
}

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
  mkdir -p ${INSTALL}/usr/lib/libretro
  cp -v ${PKG_LIBPATH} ${INSTALL}/usr/lib/libretro/
}
