# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) Originally created by Escalade (https://github.com/escalade)
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="makemkv-bin"
PKG_VERSION="1.14.0"
PKG_SHA256="2e7c7eaf4e0544f19e2ac630b1787fde2811ad60f6b4e3093875386938bfa5f6"
PKG_ARCH="x86_64"
PKG_LICENSE="OSS"
PKG_SITE="http://www.makemkv.com/"
PKG_URL="http://www.makemkv.com/download/makemkv-bin-$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="MakeMKV binaries & EULA"
PKG_TOOLCHAIN="manual"

makeinstall_target() {
  :
}
