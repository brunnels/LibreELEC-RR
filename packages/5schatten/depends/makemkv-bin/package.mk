# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) Originally created by Escalade (https://github.com/escalade)
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="makemkv-bin"
PKG_VERSION="1.12.3"
PKG_SHA256="2a9133d47c75ff03a55cfc361a27df5159de6e579a5068fb339edc77eebfef65"
PKG_ARCH="x86_64"
PKG_LICENSE="OSS"
PKG_SITE="http://www.makemkv.com/"
PKG_URL="http://www.makemkv.com/download/makemkv-bin-$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_SECTION="depends/multimedia"
PKG_SHORTDESC="MakeMKV binaries & EULA"
PKG_TOOLCHAIN="manual"

makeinstall_target() {
  :
}
