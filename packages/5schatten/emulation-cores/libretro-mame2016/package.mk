# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 0riginally created by Escalade (https://github.com/escalade)
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="libretro-mame2016"
PKG_VERSION="45e85dd"
PKG_SHA256="1d7e59b0f64ae5bc06916ecb1610cdb4664cb626a835b83f08b5c253f15ce5f8"
PKG_ARCH="any"
PKG_LICENSE="GPLv2"
PKG_SITE="https://github.com/libretro/mame2016-libretro"
PKG_URL="https://github.com/libretro/mame2016-libretro/archive/$PKG_VERSION.tar.gz"
PKG_SOURCE_DIR="mame2016-libretro-$PKG_VERSION*"
PKG_DEPENDS_TARGET="toolchain"
PKG_SECTION="emulation"
PKG_SHORTDESC="MAME (0.174-ish) for libretro"
PKG_TOOLCHAIN="make"
PKG_BUILD_FLAGS="-gold"

PKG_LIBNAME="mamearcade2016_libretro.so"
PKG_LIBPATH="$PKG_LIBNAME"
PKG_LIBVAR="MAME2016_LIB"

make_target() {
  PTR64="0"
  NOASM="0"

  if [ "$ARCH" == "arm" ]; then
    NOASM="1"
  elif [ "$ARCH" == "x86_64" ]; then
    PTR64="1"
  fi

  make REGENIE=1 VERBOSE=1 NOWERROR=1 PYTHON_EXECUTABLE=python2 CONFIG=libretro \
       LIBRETRO_OS="unix" ARCH="" PROJECT="" LIBRETRO_CPU="$ARCH" DISTRO="debian-stable" \
       CC="$CC" CXX="$CXX" LD="$LD" CROSS_BUILD="" PTR64="$PTR64" TARGET="mame" \
       SUBTARGET="arcade" PLATFORM="$ARCH" RETRO=1 OSD="retro" GIT_VERSION=$PKG_VERSION
}

makeinstall_target() {
    mkdir -p $INSTALL/usr/lib/libretro
    cp $PKG_LIBPATH $INSTALL/usr/lib/libretro/mame2016_libretro.so
}
