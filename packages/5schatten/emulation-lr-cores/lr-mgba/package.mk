# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="lr-mgba"
PKG_VERSION="bc9dff00da64b899662dc4433ff750a1f1fd715e"
PKG_SHA256="014bd2b7e632389cbadd2c8eb9aef35e9339dd8656ee7161ee4e5924e43c9a0a"
PKG_LICENSE="MPL 2.0"
PKG_SITE="https://github.com/mgba-emu/mgba"
PKG_URL="https://github.com/mgba-emu/mgba/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain retroarch zlib"
PKG_LONGDESC="mGBA is an emulator for running Game Boy Advance games."
PKG_TOOLCHAIN="cmake-make"

PKG_LIBNAME="mgba_libretro.so"
PKG_LIBPATH="$PKG_LIBNAME"

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

if [ "${OPENGL_SUPPORT}" = "yes" -a "${PROJECT}" = "Generic" ]; then
  PKG_DEPENDS_TARGET+=" libepoxy"
elif [ "${OPENGLES_SUPPORT}" = "yes" ]; then
  PKG_CMAKE_OPTS_TARGET+=" -DBUILD_GLES2=ON"
fi

pre_make_target() {
  sed -e "s/set(VERSION_STRING \${GIT_BRANCH}-\${GIT_REV}-\${GIT_COMMIT_SHORT})/set(VERSION_STRING master-${PKG_VERSION:0:7})/" -i ${PKG_BUILD}/version.cmake
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/lib/libretro
  cp $PKG_LIBPATH $INSTALL/usr/lib/libretro/
}
