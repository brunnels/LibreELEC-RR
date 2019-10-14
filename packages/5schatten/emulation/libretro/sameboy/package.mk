# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2019-present Frank Hartung (supervisedthinking (@) gmail.com)

PKG_NAME="sameboy"
PKG_VERSION="c76e56b58ad6eea859710208b2b9ec2fd46b69db"
PKG_SHA256="41bc9e1393f260869c65880a696ca967e8fbf4325a6e7f994d580893f0f2d9a6"
PKG_LICENSE="GPLv2"
PKG_SITE="https://github.com/libretro/SameBoy"
PKG_URL="https://github.com/libretro/SameBoy/archive/${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain linux glibc"
PKG_LONGDESC="Gameboy and Gameboy Color emulator written in C"
PKG_BUILD_FLAGS="+lto"

PKG_LIBNAME="sameboy_libretro.so"
PKG_LIBPATH="libretro/${PKG_LIBNAME}"

PKG_MAKE_OPTS_TARGET=" -C libretro GIT_VERSION=${PKG_VERSION:0:7}"

makeinstall_target() {
    mkdir -p ${INSTALL}/usr/lib/libretro
    cp -v ${PKG_LIBPATH} ${INSTALL}/usr/lib/libretro/
}
