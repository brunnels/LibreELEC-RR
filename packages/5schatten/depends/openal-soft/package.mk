# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 0riginally created by Escalade (https://github.com/escalade)
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="openal-soft"
PKG_VERSION="1.18.2"
PKG_SHA256="9f8ac1e27fba15a59758a13f0c7f6540a0605b6c3a691def9d420570506d7e82"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="http://www.openal.org/"
PKG_URL="http://kcat.strangesoft.net/openal-releases/$PKG_NAME-$PKG_VERSION.tar.bz2"
PKG_DEPENDS_TARGET="toolchain alsa-lib"
PKG_SECTION="emulation/depends"
PKG_SHORTDESC="openal: Open Audio Library"
PKG_LONGDESC="OpenAL, the Open Audio Library, is a joint effort to create an open, vendor- neutral, cross-platform API for interactive, primarily spatialized audio. OpenAL's primary audience are application developers and desktop users that rely on portable standards like OpenGL, for games and other multimedia applications. OpenAL is already supported by a number of hardware vendors and developers."

PKG_CMAKE_OPTS_TARGET="-DALSOFT_EXAMPLES=off \
                       -DALSOFT_TESTS=off \
                       -DALSOFT_UTILS=off \
                       -DALSOFT_BACKEND_OSS=off \
                       -DALSOFT_BACKEND_WAVE=off \
                       -DALSOFT_BACKEND_PULSEAUDIO=off"

post_makeinstall_target() {
  mkdir -p $INSTALL/etc/openal
  sed s/^#drivers.*/drivers=alsa/ $INSTALL/usr/share/openal/alsoftrc.sample > $INSTALL/etc/openal/alsoft.conf
  rm -rf $INSTALL/usr/share/openal
}
