# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 0riginally created by Escalade (https://github.com/escalade)
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="SDL_sound"
PKG_VERSION="f0d57c9b72d8"
PKG_SHA256="b294a967ce420d71ceabf1f13b6a83b7360abb83eb170efeb5ceddce4794974a"
PKG_ARCH="any"
PKG_LICENSE="GPLv3"
PKG_SITE="https://www.icculus.org/SDL_sound/"
PKG_URL="http://hg.icculus.org/icculus/SDL_sound/archive/$PKG_VERSION.tar.gz"
PKG_SOURCE_DIR="SDL_sound-$PKG_VERSION"
PKG_DEPENDS_TARGET="toolchain alsa-lib SDL2"
PKG_SECTION="emulation/depends"
PKG_SHORTDESC="SDL_sound library"
PKG_TOOLCHAIN="autotools"

PKG_CONFIGURE_OPTS_TARGET="--prefix=/usr \
                           --disable-speex \
                           ac_cv_path_SDL2_CONFIG=$SYSROOT_PREFIX/usr/bin/sdl2-config"

post_unpack() {
  touch $PKG_BUILD/README
}

pre_configure_target() {
  export LDFLAGS="$LDFLAGS -lm"
}

post_makeinstall_target() {
  ln -sf $SYSROOT_PREFIX/usr/include/SDL/SDL_sound.h $SYSROOT_PREFIX/usr/include/SDL2/SDL_sound.h
}
