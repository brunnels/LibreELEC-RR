# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2018-present Frank Hartung (supervisedthinking (@) gmail.com)

PKG_NAME="tyrquake"
PKG_VERSION="bc3203a399df6e1e0ff04d53ae2d1268645c95a7"
PKG_SHA256="3c1f20128c44622de646f17e5d90c87a6486cd12586bd6855b812bfef02317f0"
PKG_LICENSE="GPLv3"
PKG_SITE="https://github.com/libretro/tyrquake"
PKG_URL="https://github.com/libretro/tyrquake/archive/${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain linux glibc"
PKG_LONGDESC="Libretro port of Tyrquake (Quake 1 engine)"
PKG_TOOLCHAIN="make"
PKG_BUILD_FLAGS="+lto"

PKG_LIBNAME="tyrquake_libretro.so"
PKG_LIBPATH="${PKG_LIBNAME}"

PKG_MAKE_OPTS_TARGET="GIT_VERSION=${PKG_VERSION:0:7}"

makeinstall_target() {
  mkdir -p ${INSTALL}/usr/bin
  mkdir -p ${INSTALL}/usr/lib/libretro

  cp ${PKG_DIR}/scripts/* ${INSTALL}/usr/bin
  cp -v ${PKG_LIBPATH} ${INSTALL}/usr/lib/libretro/
}
