# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="spectre-meltdown-checker"
PKG_VERSION="80e0db7"
PKG_SHA256="76ee530db7b3770a1e7a0fabea1e30c3737ee8ceb8bc085f18e7e59ea5e1772c"
PKG_ARCH="any"
PKG_LICENSE="GPLv3"
PKG_SITE="https://github.com/speed47/spectre-meltdown-checker"
PKG_URL="https://github.com/speed47/spectre-meltdown-checker/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_SECTION="sysutils"
PKG_LONGDESC="A shell script to tell if your system is vulnerable against the several speculative execution CVEs that were made public in 2018."
PKG_TOOLCHAIN="manual"

makeinstall_target() {
 mkdir -p $INSTALL/usr/bin
 chmod +x $PKG_BUILD/spectre-meltdown-checker.sh
 cp $PKG_BUILD/spectre-meltdown-checker.sh $INSTALL/usr/bin/sm-checker
}
