# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2018-present Frank Hartung (supervisedthinking (@) gmail.com)

PKG_NAME="lr-mupen64plus"
PKG_VERSION="be81697cd2cdee3a8488eac6789b984975006730"
PKG_SHA256="2ab7255f8fb32f74eb7dd757a755914e29526ddb3536cfef065c26cf37870d88"
PKG_LICENSE="GPLv2"
PKG_SITE="https://github.com/libretro/mupen64plus-libretro"
PKG_URL="https://github.com/libretro/mupen64plus-libretro/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain linux glibc zlib"
PKG_LONGDESC="Mupen64Plus is mupen64plus + GLideN64 + libretro"
PKG_TOOLCHAIN="make"

PKG_LIBNAME="mupen64plus_libretro.so"
PKG_LIBPATH="$PKG_LIBNAME"

PKG_MAKE_OPTS_TARGET="GIT_VERSION=${PKG_VERSION:0:7}"

configure_package() {
  # Displayserver Support
  if [ "${DISPLAYSERVER}" = "x11" ]; then
    PKG_DEPENDS_TARGET+=" xorg-server"
  fi

  # OpenGL Support
  if [ "${OPENGL_SUPPORT}" = "yes" ]; then
    PKG_DEPENDS_TARGET+=" ${OPENGL}"
  fi

  # OpenGLES Support
  if [ "${OPENGLES_SUPPORT}" = "yes" ]; then
    PKG_DEPENDS_TARGET+=" ${OPENGLES}"
  fi
}

pre_configure_target() {
  # OpenGLES Support
  if [ "${OPENGLES_SUPPORT}" = "yes" ]; then
    PKG_MAKE_OPTS_TARGET+=" FORCE_GLES=1"
  fi

  if [ "$PROJECT" = "RPi" ]; then
    case $DEVICE in
      RPi)
        PKG_MAKE_OPTS_TARGET+=" platform=rpi"
        ;;
      RPi2)
        PKG_MAKE_OPTS_TARGET+=" platform=rpi2"
        ;;
    esac
  else
    # Dynarec
    if [ "${ARCH}" = "arm" ]; then
      PKG_MAKE_OPTS_TARGET+=" WITH_DYNAREC=arm"
    elif [ "${ARCH}" = "x86_64" ]; then
      PKG_MAKE_OPTS_TARGET+=" WITH_DYNAREC=x86_64"
    fi
    # NEON Support
    if target_has_feature neon; then
      PKG_MAKE_OPTS_TARGET+=" HAVE_NEON=1"
    fi
  fi
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/lib/libretro
  cp $PKG_LIBPATH $INSTALL/usr/lib/libretro/
}
