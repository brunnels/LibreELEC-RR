# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2009-2016 Lukas Rusak (lrusak@libreelec.tv)
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="containerd"
PKG_VERSION="1.2.10"
PKG_SHA256="a0965e1492fca558629826f1aa89a9675de3d451cec67540400b30c0bf6ac387"
PKG_LICENSE="APL"
PKG_SITE="https://containerd.tools/"
PKG_URL="https://github.com/containerd/containerd/archive/v$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain go:host"
PKG_LONGDESC="A daemon to control runC, built for performance and density."
PKG_TOOLCHAIN="manual"

# Git commit of the matching release https://github.com/containerd/containerd/releases
PKG_GIT_COMMIT="b34a5c8af56e510852c35414db4c1f4fa6172339"

pre_make_target() {

  go_configure

  export CONTAINERD_VERSION=${PKG_VERSION}
  export CONTAINERD_REVISION=${PKG_GIT_COMMIT}
  export CONTAINERD_PKG=github.com/containerd/containerd
  export LDFLAGS="-w -extldflags -static -X ${CONTAINERD_PKG}/version.Version=${CONTAINERD_VERSION} -X ${CONTAINERD_PKG}/version.Revision=${CONTAINERD_REVISION} -X ${CONTAINERD_PKG}/version.Package=${CONTAINERD_PKG} -extld $CC"

  mkdir -p ${GOPATH}
  if [ -d ${PKG_BUILD}/vendor ]; then
    mv ${PKG_BUILD}/vendor ${GOPATH}/src
  fi

  ln -fs ${PKG_BUILD} ${GOPATH}/src/github.com/containerd/containerd
}

make_target() {
  mkdir -p bin
  ${GOLANG} build -v -o bin/containerd      -a -tags "static_build no_btrfs" -ldflags "${LDFLAGS}" ./cmd/containerd
  ${GOLANG} build -v -o bin/containerd-shim -a -tags "static_build no_btrfs" -ldflags "${LDFLAGS}" ./cmd/containerd-shim
}