# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="lr-fbalpha"
PKG_VERSION="bfededf36c4ca6f37926a66822d860a9754080c3"
PKG_SHA256="0c31bb6fe84f2dfa9adead0a6fd23cb2d516c96c7213cec89e66444e13fe8478"
PKG_LICENSE="GPLv3"
PKG_SITE="https://github.com/libretro/fbalpha"
PKG_URL="https://github.com/libretro/fbalpha/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain retroarch"
PKG_LONGDESC="Port of Final Burn Alpha to Libretro (pre-v0.2.97.44)."
PKG_TOOLCHAIN="manual"

PKG_LIBNAME="fbalpha_libretro.so"
PKG_LIBPATH="$PKG_LIBNAME"

make_target() {
  # NEON Support
  if target_has_feature neon; then
    FBALPHA_SUPPORT_NEON="HAVE_NEON=1"
  fi

  if [ "$PROJECT" = "RPi" ]; then
    case $DEVICE in
      RPi)
        make -f makefile.libretro platform=armv CC=$CC CXX=$CXX GIT_VERSION=${PKG_VERSION:0:7}
        ;;
      RPi2)
        make -f makefile.libretro platform=rpi2 CC=$CC CXX=$CXX GIT_VERSION=${PKG_VERSION:0:7}
        ;;
    esac
  else
    make -f makefile.libretro $FBALPHA_SUPPORT_NEON CC=$CC CXX=$CXX GIT_VERSION=${PKG_VERSION:0:7}
  fi
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/lib/libretro
  cp $PKG_LIBPATH $INSTALL/usr/lib/libretro/
}
