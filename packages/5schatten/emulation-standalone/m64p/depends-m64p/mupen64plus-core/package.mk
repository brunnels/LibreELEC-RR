# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="mupen64plus-core"
PKG_VERSION="ef15526ecdcde8f984a6162f9b874aa87108a3d4"
PKG_SHA256="e2403e8915032e519dc6b94f46820b10e05830992d46806ca47172020c8246cc"
PKG_LICENSE="GPLv2"
PKG_SITE="https://github.com/mupen64plus/mupen64plus-core"
PKG_URL="https://github.com/mupen64plus/mupen64plus-core/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain SDL2-git freetype libpng zlib glu"
PKG_LONGDESC="Core module of the Mupen64Plus project"
PKG_TOOLCHAIN="manual"

# Add nasm dependency for mupen64plus-core
if [ "${PROJECT}" = "Generic" ]; then
  PKG_DEPENDS_TARGET+=" nasm:host"
fi

configure_target() {
  export SYSROOT_PREFIX=$SYSROOT_PREFIX
}

make_target() {
  cd $PKG_BUILD/projects/unix
  PKG_MAKE_OPTS_TARGET="all SHAREDIR=/usr/config/mupen64plus"

  # ARM NEON optimization
  if target_has_feature neon; then
    PKG_MAKE_OPTS_TARGET+=" NEON=1"
  fi
  # build against GLESv2 instead of OpenGL
  if [ "${OPENGLES_SUPPORT}" = "yes" ]; then
    PKG_MAKE_OPTS_TARGET+=" USE_GLES=1"
  fi

  make -j$CONCURRENCY_MAKE_LEVEL ${PKG_MAKE_OPTS_TARGET} 
}
