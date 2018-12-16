# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="lr-mupen64plus"
PKG_VERSION="b01d1ba85b5ee5f0d549a7f1ac504ea8fe01f34e"
PKG_SHA256="397413c713c0c1d099f48e54cadd919f53d57d283f8a174258a3f81146cf485a"
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
