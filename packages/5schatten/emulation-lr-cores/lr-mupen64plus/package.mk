# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="lr-mupen64plus"
PKG_VERSION="0064cb4538f9f687c133d214ab9be50564ad7e8a"
PKG_SHA256="e2f9dd9566bc8128b0122ca9858358cf13f50680c5271c71f02c1fcb7eb31ea8"
PKG_LICENSE="GPLv2"
PKG_SITE="https://github.com/libretro/mupen64plus-libretro"
PKG_URL="https://github.com/libretro/mupen64plus-libretro/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain retroarch"
PKG_LONGDESC="Mupen64Plus uses GLideN64 (a graphics plugin that is not available in Parallel-N64). The emulator code itself is identical to standalone mupen64plus."
PKG_TOOLCHAIN="manual"

PKG_LIBNAME="mupen64plus_libretro.so"
PKG_LIBPATH="$PKG_LIBNAME"

pre_build_target() {
  export GIT_VERSION=${PKG_VERSION:0:7}
}

make_target() {

  if target_has_feature neon; then
    export HAVE_NEON=1
  fi

  if [ "$PROJECT" = "RPi" ]; then
    case $DEVICE in
      RPi)
        CFLAGS="$CFLAGS -I$SYSROOT_PREFIX/usr/include/interface/vcos/pthreads \
                        -I$SYSROOT_PREFIX/usr/include/interface/vmcs_host/linux"

        make FORCE_GLES=1 platform=rpi
        ;;
      RPi2)
        CFLAGS="$CFLAGS -I$SYSROOT_PREFIX/usr/include/interface/vcos/pthreads \
                        -I$SYSROOT_PREFIX/usr/include/interface/vmcs_host/linux"

        make FORCE_GLES=1 platform=rpi2
        ;;
    esac
  elif [[ "$TARGET_CPU" = "cortex-a9" ]] || [[ "$TARGET_CPU" = *"cortex-a53" ]] || [[ "$TARGET_CPU" = "cortex-a17" ]]; then
    make FORCE_GLES=1 WITH_DYNAREC=arm
  else
    make WITH_DYNAREC=x86_64
  fi
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/lib/libretro
  cp $PKG_LIBPATH $INSTALL/usr/lib/libretro/
}
