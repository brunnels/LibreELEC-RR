# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="mupen64plus-core"
PKG_VERSION="1b481123c2ac594b91fd7bb0bc1b0de0707c7b14"
PKG_SHA256="aec474dd3a827a0c1677a4d6252fc730758732787dfbe1a230dc7142b20fb54c"
PKG_LICENSE="GPLv2"
PKG_SITE="https://github.com/mupen64plus/mupen64plus-core"
PKG_URL="https://github.com/mupen64plus/mupen64plus-core/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain SDL2-git freetype libpng zlib"
PKG_LONGDESC="Core module of the Mupen64Plus project"
PKG_TOOLCHAIN="make"

# Generic depends on nasm & glu
if [ "${PROJECT}" = "Generic" ]; then
  PKG_DEPENDS_TARGET+=" nasm:host glu"
fi

PKG_MAKE_OPTS_TARGET="-C projects/unix SRCDIR=../../src all NEW_DYNAREC=1 SHAREDIR=/usr/config/mupen64plus"

pre_configure_target() {
  export SYSROOT_PREFIX=$SYSROOT_PREFIX

  # ARCH arm
  if [ "${ARCH}" = "arm" ]; then
    PKG_MAKE_OPTS_TARGET+=" DYNAREC=arm HOST_CPU=armv7"

    # ARM NEON optimization
    if target_has_feature neon; then
      PKG_MAKE_OPTS_TARGET+=" NEON=1"
    fi
  fi
  
  # build against GLESv2 instead of OpenGL
  if [ "${OPENGLES_SUPPORT}" = "yes" ]; then
    PKG_MAKE_OPTS_TARGET+=" USE_GLES=1"
    # RPi OpenGLES Features Support
    if [ "${OPENGLES}" = "bcm2835-driver" ]; then
      PKG_MAKE_OPTS_TARGET+=" VC=1"
    fi
  fi
}

makeinstall_target() {
  mv $PKG_BUILD/projects/unix/*.so* $PKG_BUILD/
}
