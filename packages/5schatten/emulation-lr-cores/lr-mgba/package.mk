# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="lr-mgba"
PKG_VERSION="6158a4fb8d6bc8e7df42504bad7e18d9b5c667a3"
PKG_SHA256="8397b053111685373ada2c1bac9a51019a74e8a753893a850683a5d99a2b1e7f"
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
