# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="mupen64plus-rsp-hle"
PKG_VERSION="12339811299155b66bc0a944457e83ea49f30b6f"
PKG_SHA256="240d4a671ff20328f1c17e30cee36cd731b759ca87c1d0df1350f1f169a05b3d"
PKG_LICENSE="GPLv2"
PKG_SITE="https://github.com/mupen64plus/mupen64plus-rsp-hle"
PKG_URL="https://github.com/mupen64plus/mupen64plus-rsp-hle/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain SDL2-git mupen64plus-core"
PKG_LONGDESC="RSP processor plugin for the Mupen64Plus v2.0 project. This plugin is based on the Mupen64 HLE RSP plugin v0.2 with Azimers code by Hacktarux"
PKG_TOOLCHAIN="manual"

make_target() {
  PKG_MAKE_OPTS_TARGET="all APIDIR=$(get_build_dir mupen64plus-core)/src/api"

  cd $PKG_BUILD/projects/unix
  make -j$CONCURRENCY_MAKE_LEVEL ${PKG_MAKE_OPTS_TARGET}
}
