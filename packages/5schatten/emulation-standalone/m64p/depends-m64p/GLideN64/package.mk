# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="GLideN64"
PKG_VERSION="d420737d6dc41e6ada802ff239159f1a1702bafa"
PKG_SHA256="f093d1712d075646097d92c30066a341db39f30b96ef966987028d4aaee888b8"
PKG_LICENSE="GPLv2"
PKG_SITE="https://github.com/gonetz/GLideN64"
PKG_URL="https://github.com/gonetz/GLideN64/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain freetype zlib"
PKG_LONGDESC="A new generation, open-source graphics plugin for N64 emulators."
PKG_TOOLCHAIN="manual"

# workaround for shader cache crash issue github.com/gonetz/GLideN64/issues/1665
if [ "${PROJECT}" = "RPi" ]; then
  PKG_PATCH_DIRS="${PROJECT}"
fi

make_target() {
  cd $PKG_BUILD/src
  ./getRevision.sh
  cd $PKG_BUILD/projects/cmake
  rm -rf $PKG_BUILD/src/GLideNHQ/inc

  # GLideN64 fix OpenGL lib path
  if [ "${OPENGL_SUPPORT}" = "yes" ]; then
    PKG_GLIDEN64_GL_PATH="-DOPENGL_gl_LIBRARY=$SYSROOT_PREFIX/usr/lib"
  elif [ "${OPENGLES_SUPPORT}" = "yes" ]; then
    PKG_GLIDEN64_GL_PATH="-DOPENGLES_gl_LIBRARY=$SYSROOT_PREFIX/usr/lib"
  fi

  # GLideN64 ARM NEON optimization
  if target_has_feature neon; then
    PKG_GLIDEN64_NEON="-DNEON_OPT=On"
  fi

  cmake -DUSE_SYSTEM_LIBS=On \
        -DVEC4_OPT=On \
        -DCRC_OPT=On \
        -DMUPENPLUSAPI=On \
        ${PKG_GLIDEN64_NEON} \
        ${PKG_GLIDEN64_GL_PATH} \
        $PKG_BUILD/src/

  make -j$CONCURRENCY_MAKE_LEVEL
}
