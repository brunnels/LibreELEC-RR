# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 0riginally created by Escalade (https://github.com/escalade)
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="openssl-compat"
PKG_VERSION="1.0.2o"
PKG_SHA256="ec3f5c9714ba0fd45cb4e087301eb1336c317e0d20b575a125050470e8089e4d"
PKG_ARCH="any"
PKG_LICENSE="BSD"
PKG_SITE="https://www.openssl.org"
PKG_URL="https://www.openssl.org/source/openssl-$PKG_VERSION.tar.gz"
PKG_SOURCE_DIR="openssl-$PKG_VERSION"
PKG_DEPENDS_HOST="ccache:host"
PKG_DEPENDS_TARGET="toolchain"
PKG_SECTION="security"
PKG_SHORTDESC="The Open Source toolkit for Secure Sockets Layer and Transport Layer Security"
PKG_LONGDESC="The Open Source toolkit for Secure Sockets Layer and Transport Layer Security"

PKG_CONFIGURE_OPTS_SHARED="--openssldir=/etc/ssl \
                           --libdir=lib \
                           shared \
                           threads \
                           no-ec2m \
                           no-gmp \
                           no-jpake \
                           no-krb5 \
                           no-libunbound \
                           no-md2 \
                           no-rc5 \
                           no-rfc3779
                           no-sctp \
                           no-ssl-trace \
                           no-ssl2 \
                           no-ssl3 \
                           no-store \
                           no-unit-test \
                           no-weak-ssl-ciphers \
                           no-zlib \
                           no-zlib-dynamic \
                           no-static-engine"

pre_configure_target() {
  export MAKEFLAGS=-j1
  mkdir -p $PKG_BUILD/.$TARGET_NAME
  cp -a $PKG_BUILD/* $PKG_BUILD/.$TARGET_NAME/

  case $TARGET_ARCH in
    x86_64)
      OPENSSL_TARGET=linux-x86_64
      PLATFORM_FLAGS=enable-ec_nistp_64_gcc_128
      ;;
    arm)
      OPENSSL_TARGET=linux-armv4
      ;;
    aarch64)
      OPENSSL_TARGET=linux-aarch64
      ;;
  esac
}

configure_target() {
  cd $PKG_BUILD/.$TARGET_NAME
  ./Configure --prefix=/usr $PKG_CONFIGURE_OPTS_SHARED $PLATFORM_FLAGS $OPENSSL_TARGET
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/lib
  cp libcrypto.so $INSTALL/usr/lib/libcrypto.so.1.0.0
  cp libssl.so $INSTALL/usr/lib/libssl.so.1.0.0
}
