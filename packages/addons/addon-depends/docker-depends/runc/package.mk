# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2009-2016 Lukas Rusak (lrusak@libreelec.tv)
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="runc"
PKG_VERSION="1.0.0-rc9"
PKG_SHA256="2ec69c25df9f02c6fd38eb287145f8afba6772f809abe01df4534b5bfd68e8d4"
PKG_LICENSE="APL"
PKG_SITE="https://github.com/opencontainers/runc"
PKG_URL="https://github.com/opencontainers/runc/archive/v${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain go:host"
PKG_LONGDESC="A CLI tool for spawning and running containers according to the OCI specification."
PKG_TOOLCHAIN="manual"

# Git commit of the matching release https://github.com/opencontainers/runc/releases
PKG_GIT_COMMIT="d736ef14f0288d6993a1845745d6756cfc9ddd5a"

pre_make_target() {
  go_configure

  export LDFLAGS="-w -extldflags -static -X main.gitCommit=${PKG_GIT_COMMIT} -X main.version=$(cat ./VERSION) -extld $CC"

  mkdir -p ${GOPATH}
  if [ -d $PKG_BUILD/vendor ]; then
    mv $PKG_BUILD/vendor ${GOPATH}/src
  fi

  ln -fs $PKG_BUILD ${GOPATH}/src/github.com/opencontainers/runc
}

make_target() {
  mkdir -p bin
  $GOLANG build -v -o bin/runc -a -tags "cgo static_build" -ldflags "$LDFLAGS" ./
}
