# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="lr-mgba"
PKG_VERSION="38bad71e119aa71f9c89d066fdfe589d3cdfd2e6"
PKG_SHA256="851ef73c10e28caa5d3569c50cdd8cfe4a5ce304ea0c5e0699259669ae3bebd5"
PKG_LICENSE="MPL 2.0"
PKG_SITE="https://github.com/mgba-emu/mgba"
PKG_URL="https://github.com/mgba-emu/mgba/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain retroarch"
PKG_LONGDESC="mGBA is an emulator for running Game Boy Advance games."
PKG_TOOLCHAIN="cmake-make"

PKG_LIBNAME="mgba_libretro.so"
PKG_LIBPATH="$PKG_LIBNAME"

if [ "$OPENGL_SUPPORT" = "yes" ] && [ "$PROJECT" = "Generic" ]; then
  PKG_DEPENDS_TARGET+=" libepoxy"

elif [ "$OPENGLES_SUPPORT" = "yes" ]; then
  MGBA_SUPPORT_OPENGLES="-DBUILD_GLES2=ON"
fi

PKG_CMAKE_OPTS_TARGET="-DUSE_DEBUGGERS=OFF \
                       -DBUILD_QT=OFF \
                       -DBUILD_SDL=OFF \
                       -DBUILD_LIBRETRO=ON \
                       -DSKIP_LIBRARY=ON \
                       $MGBA_SUPPORT_OPENGLES"
pre_make_target() {
  sed -i -e "s/set(VERSION_STRING \${GIT_BRANCH}-\${GIT_REV}-\${GIT_COMMIT_SHORT})/set(VERSION_STRING master-${PKG_VERSION:0:7})/" $PKG_BUILD/version.cmake
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/lib/libretro
  cp $PKG_LIBPATH $INSTALL/usr/lib/libretro/
}
