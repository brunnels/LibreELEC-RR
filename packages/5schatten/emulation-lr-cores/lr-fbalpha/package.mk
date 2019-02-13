# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="lr-fbalpha"
PKG_VERSION="0581bf39ec9ac7a6f63d37324bc0083e9f024880"
PKG_SHA256="9b9cc7aad7ff4eedcc2faa18e36ea969911bdba8a868be7d983dc4c8e92b9fd8"
PKG_LICENSE="GPLv3"
PKG_SITE="https://github.com/libretro/fbalpha"
PKG_URL="https://github.com/libretro/fbalpha/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain linux glibc"
PKG_LONGDESC="Port of Final Burn Alpha to Libretro (v0.2.97.44)."
PKG_TOOLCHAIN="make"

PKG_LIBNAME="fbalpha_libretro.so"
PKG_LIBPATH="$PKG_LIBNAME"

PKG_MAKE_OPTS_TARGET="-f makefile.libretro GIT_VERSION=${PKG_VERSION:0:7}"

pre_make_target() {
  if [ "$PROJECT" = "RPi" ]; then
    case $DEVICE in
      RPi)
        PKG_MAKE_OPTS_TARGET+=" platform=armv"
        ;;
      RPi2)
        PKG_MAKE_OPTS_TARGET+=" platform=rpi2"
        ;;
    esac
  else
    # NEON Support ?
    if target_has_feature neon; then
      PKG_MAKE_OPTS_TARGET+=" HAVE_NEON=1"
    fi
  fi
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/lib/libretro
  cp $PKG_LIBPATH $INSTALL/usr/lib/libretro/
}
