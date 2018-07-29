# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="freeimage"
PKG_VERSION="3.17"
PKG_SHA256="8512934ae7774b60bacdd10dc0d436ace207ac5b7c3f957d002a39c85b38e6bc"
PKG_ARCH="any"
PKG_LICENSE="GPLv3"
PKG_SITE="http://freeimage.sourceforge.net/"
PKG_URL="https://github.com/SupervisedThinking/freeimage/archive/$PKG_VERSION.tar.gz"
PKG_SOURCE_DIR="FreeImage"
PKG_DEPENDS_TARGET="toolchain"
PKG_SECTION="emulation/depends"
PKG_SHORTDESC="FreeImage library"

pre_make_target() {
  export CXXFLAGS="$CXXFLAGS -Wno-narrowing"
  export CFLAGS="$CFLAGS -DPNG_ARM_NEON_OPT=0"
}
