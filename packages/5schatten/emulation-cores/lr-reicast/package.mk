# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="lr-reicast"
PKG_VERSION="d7c47cd"
PKG_SHA256="5f22b310cc4e3d1d069ab838e3dd0cfeec0100c5c7e23e643ead841648b54361"
PKG_LICENSE="GPLv2"
PKG_SITE="https://github.com/libretro/reicast-emulator"
PKG_URL="https://github.com/libretro/reicast-emulator/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain retroarch"
PKG_LONGDESC="Reicast is a multiplatform Sega Dreamcast emulator"
PKG_TOOLCHAIN="manual"
PKG_BUILD_FLAGS="-gold"

PKG_LIBNAME="reicast_libretro.so"
PKG_LIBPATH="$PKG_LIBNAME"

pre_make_target() {
 export BUILD_SYSROOT=$SYSROOT_PREFIX
}

make_target() {
  if [ "$PROJECT" == "Amlogic" ]; then
    make FORCE_GLES=1 HAVE_OPENMP=0 GIT_VERSION=$PKG_VERSION WITH_DYNAREC=$ARCH platform=rpi3
  
  elif [ "$PROJECT" == "RPi" ]; then
    case $DEVICE in
      RPi)
        make FORCE_GLES=1 HAVE_OPENMP=0 GIT_VERSION=$PKG_VERSION WITH_DYNAREC=$ARCH platform=rpi
        ;;
      RPi2)
        make FORCE_GLES=1 HAVE_OPENMP=0 GIT_VERSION=$PKG_VERSION WITH_DYNAREC=$ARCH platform=rpi2
        ;;
    esac

  else
    make AS=${AS} CC_AS=${AS} HAVE_OPENMP=0 HAVE_OIT=1 GIT_VERSION=$PKG_VERSION WITH_DYNAREC=$ARCH
  fi
}

makeinstall_target() {
    mkdir -p $INSTALL/usr/lib/libretro
    cp $PKG_LIBPATH $INSTALL/usr/lib/libretro/
}
