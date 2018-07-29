# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="dmidecode"
PKG_VERSION="3.1"
PKG_SHA256="d766ce9b25548c59b1e7e930505b4cad9a7bb0b904a1a391fbb604d529781ac0"
PKG_ARCH="x86_64"
PKG_LICENSE="GPL"
PKG_SITE="http://www.nongnu.org/dmidecode/"
PKG_URL="http://download.savannah.gnu.org/releases/dmidecode/$PKG_NAME-$PKG_VERSION.tar.xz"
PKG_DEPENDS_TARGET="toolchain"
PKG_SHORTDESC="dmidecode: report DMI information"
PKG_LONGDESC="Dmidecode reports information about your system's hardware as described in your system BIOS according to the SMBIOS/DMI standard (see a sample output). This information typically includes system manufacturer, model name, serial number, BIOS version, asset tag as well as a lot of other details of varying level of interest and reliability depending on the manufacturer. This will often include usage status for the CPU sockets, expansion slots (e.g. AGP, PCI, ISA) and memory module slots, and the list of I/O ports (e.g. serial, parallel, USB)."

makeinstall_target() {
  make prefix=$INSTALL/usr install-bin
}
