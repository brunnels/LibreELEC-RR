# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) Originally created by Escalade (https://github.com/escalade)
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="makemkv"
PKG_VERSION="1.12.3"
PKG_SHA256="39f4652b4f55af800dc0ec371e1864d59d8dda115b204e6389f4fb97701614f0"
PKG_ARCH="x86_64"
PKG_LICENSE="OSS"
PKG_SITE="http://makemkv.com/"
PKG_URL="http://www.makemkv.com/download/makemkv-oss-$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain makemkv-bin openssl expat ffmpeg zlib"
PKG_SECTION="lib/multimedia"
PKG_SHORTDESC="MakeMKV converts proprietary and usually encrypted video clips from disc into MKV files."
PKG_LONGDESC="MakeMKV can instantly stream decrypted video without intermediate conversion to wide range of players, so you may watch Blu-ray and DVD discs with your favorite player on your favorite OS or on your favorite device."

PKG_IS_ADDON="yes"
PKG_ADDON_NAME="MakeMKV"
PKG_ADDON_TYPE="xbmc.python.script"

PKG_CONFIGURE_OPTS_TARGET="--disable-gui"

pre_configure_target() {
  cd ..
  rm -rf .$TARGET_NAME
}

makeinstall_target() {
  :
}

addon() {
  # install makemkv binary
  mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/bin
  install -m 0755 $(get_build_dir makemkv-bin)/bin/amd64/makemkvcon $ADDON_BUILD/$PKG_ADDON_ID/bin/makemkvcon.bin

  # licence file
  mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/license
  cp $(get_build_dir makemkv-bin)/src/eula_en_linux.txt $ADDON_BUILD/$PKG_ADDON_ID/license

  # install libs
  mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/lib
  cp $PKG_BUILD/out/libmakemkv.so.? $ADDON_BUILD/$PKG_ADDON_ID/lib
  cp $PKG_BUILD/out/libdriveio.so.? $ADDON_BUILD/$PKG_ADDON_ID/lib
  cp $PKG_BUILD/out/libmmbd.so.? $ADDON_BUILD/$PKG_ADDON_ID/lib
  cp -PL $(get_build_dir openssl)/.install_pkg/usr/lib/libcrypto.so.?.?.? $ADDON_BUILD/$PKG_ADDON_ID/lib
}
