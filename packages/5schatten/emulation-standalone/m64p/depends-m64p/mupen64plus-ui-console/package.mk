# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="mupen64plus-ui-console"
PKG_VERSION="d4303d96c4c7acfa664b59016c670768403c639c"
PKG_SHA256="c000346a1db487d86acfe1c56a0803f035a9e66af3b42a991ebad8df836ceccd"
PKG_LICENSE="GPLv2"
PKG_SITE="https://github.com/mupen64plus/mupen64plus-ui-console"
PKG_URL="https://github.com/mupen64plus/mupen64plus-ui-console/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain SDL2-git mupen64plus-core"
PKG_LONGDESC="Console (command-line) front-end user interface for Mupen64Plus v2.0 project"
PKG_TOOLCHAIN="make"

PKG_MAKE_OPTS_TARGET="-f projects/unix/Makefile \
                      SRCDIR=src \
                      APIDIR=$(get_build_dir mupen64plus-core)/src/api \
                      SHAREDIR=/usr/config/mupen64plus \
                      COREDIR=/usr/lib/mupen64plus/ \
                      PLUGINDIR=/usr/lib/mupen64plus/ \
                      all"

pre_configure_target() {
  export SYSROOT_PREFIX=$SYSROOT_PREFIX
}

makeinstall_target() {
 :
}
