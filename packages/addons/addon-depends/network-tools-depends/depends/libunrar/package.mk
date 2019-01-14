# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2019-present Team LibreELEC (https://libreelec.tv)

. $(get_pkg_directory unrar)/package.mk

PKG_NAME="libunrar"
PKG_LONGDESC="unrar lib"

make_target() {
  make CXX="$CXX" \
     CXXFLAGS="$TARGET_CXXFLAGS" \
     lib \
     AR="$AR" \
     -f makefile
}

makeinstall_target() {
  :
}
