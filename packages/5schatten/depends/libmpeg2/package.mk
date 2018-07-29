# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) Originally created by Escalade (https://github.com/escalade)
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="libmpeg2"
PKG_VERSION="0.5.1"
PKG_SHA256="dee22e893cb5fc2b2b6ebd60b88478ab8556cb3b93f9a0d7ce8f3b61851871d4"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="http://libmpeg2.sourceforge.net/"
PKG_URL="http://libmpeg2.sourceforge.net/files/$PKG_NAME-$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_SECTION="emulation/depends"
PKG_SHORTDESC="libmpeg2: The MPEG Library - version 2"
PKG_LONGDESC="The MPEG Library is a collection of C routines to decode MPEG-1 and MPEG-2 movies and dither them in a variety of colour schemes."
PKG_TOOLCHAIN="configure"

PKG_CONFIGURE_OPTS_TARGET="--disable-sdl --without-x"

post_makeinstall_target() {
  rm -rf $INSTALL/usr/bin
}

