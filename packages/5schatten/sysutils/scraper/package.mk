# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 0riginally created by Escalade (https://github.com/escalade)
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="scraper"
PKG_VERSION="1.4.6"
PKG_LICENSE="MIT"
PKG_SITE="https://github.com/sselph/scraper"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="A scraper for EmulationStation written in Go using hashing"
PKG_TOOLCHAIN="manual"

pre_build_target() {
  cd $PKG_BUILD
  # Download the precompiled binary
  if [ "${PROJECT}" = "Amlogic_Legacy" ]; then
    wget $PKG_SITE/releases/download/v$PKG_VERSION/${PKG_NAME}_rpi2.zip
  elif [ "${PROJECT}" = "Generic" ]; then
    wget $PKG_SITE/releases/download/v$PKG_VERSION/${PKG_NAME}_linux_amd64.zip
  elif [ "${PROJECT}" = "RPi" ]; then
    if [ "${DEVICE}" = "RPi" ]; then
      wget $PKG_SITE/releases/download/v$PKG_VERSION/${PKG_NAME}_rpi.zip
    elif [ "$DEVICE" = "RPi2" ]; then
      wget $PKG_SITE/releases/download/v$PKG_VERSION/${PKG_NAME}_rpi2.zip
    fi
  fi
  # Extract binary
  unzip -o scraper*.zip
  cd -
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/bin
  cp -PR scraper $INSTALL/usr/bin
}
