# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="lr-mgba"
PKG_VERSION="2d303cdda314c48a9534fef04782f8ad2bf2ca6a" # v0.7.0
PKG_SHA256="8c3d409e6f2e6b6eb1e7bec331149316ddb0205114f494fb7f90e3a7bd3ede9c"
PKG_LICENSE="MPL 2.0"
PKG_SITE="https://github.com/mgba-emu/mgba"
PKG_URL="https://github.com/mgba-emu/mgba/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain retroarch zlib"
PKG_LONGDESC="mGBA is an emulator for running Game Boy Advance games."

PKG_LIBNAME="mgba_libretro.so"
PKG_LIBPATH="$PKG_LIBNAME"

configure_package() {
  if [ "${OPENGL_SUPPORT}" = "yes" -a "${PROJECT}" = "Generic" ]; then
    PKG_DEPENDS_TARGET+=" libepoxy"
  fi
}

pre_configure_target() {
  PKG_CMAKE_OPTS_TARGET="-DUSE_DEBUGGERS=OFF \
                         -DBUILD_QT=OFF \
                         -DBUILD_SDL=OFF \
                         -DBUILD_LIBRETRO=ON \
                         -DSKIP_LIBRARY=ON \
                         -DUSE_FFMPEG=OFF \
                         -DUSE_ZLIB=ON \
                         -DUSE_MINIZIP=OFF \
                         -DUSE_LIBZIP=OFF \
                         -DUSE_MAGICK=OFF \
                         -DUSE_ELF=OFF"

  if [ "${OPENGLES_SUPPORT}" = "yes" ]; then
    PKG_CMAKE_OPTS_TARGET+=" -DBUILD_GLES2=ON"
  fi
}

pre_make_target() {
  sed -e "s/set(VERSION_STRING \${GIT_BRANCH}-\${GIT_REV}-\${GIT_COMMIT_SHORT})/set(VERSION_STRING master-${PKG_VERSION:0:7})/" -i ${PKG_BUILD}/version.cmake
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/lib/libretro
  cp $PKG_LIBPATH $INSTALL/usr/lib/libretro/
}
