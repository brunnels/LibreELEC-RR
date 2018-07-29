# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="capsimg"
PKG_VERSION="067db4c"
PKG_SHA256="0576a49a23c70b0022d423d8ae4691c8d7004ceed1527b971f2eba0fc799c0af"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/FrodeSolheim/capsimg"
PKG_URL="https://github.com/FrodeSolheim/capsimg/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_SECTION="emulation/depends"
PKG_SHORTDESC="SPS Decoder Library 5.1 (formerly IPF Decoder Lib)"
PKG_TOOLCHAIN="manual"

make_target() {
 ./bootstrap
 ./configure $options --host=$TARGET_NAME
  make -j 4
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/config/fs-uae/Plugins/CAPSImg/Linux/x86-64
  cp capsimg.so $INSTALL/usr/config/fs-uae/Plugins/CAPSImg/Linux/x86-64
}
