# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="lr-mgba"
PKG_VERSION="16688a59717d43518dfa7f9c2c10fdde148e1a70" # v0.7.1+
PKG_SHA256="d80018ac58c1c0fc3f36bbf4cf2ebb8786553d95f2c3f63835613e4d714e4a70"
PKG_LICENSE="MPL 2.0"
PKG_SITE="https://github.com/mgba-emu/mgba"
PKG_URL="https://github.com/mgba-emu/mgba/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain linux glibc zlib"
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
