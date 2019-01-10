# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="SDL_GameControllerDB"
PKG_VERSION="3d6c5b3075927f8e73b9242f102158899a629315"
PKG_SHA256="f90ef1aa122f0eaadae4caa36f1701d16d180d5b7ba5c6d4a4d97bcb3af77412"
PKG_LICENSE="OSS"
PKG_SITE="https://github.com/gabomdq/SDL_GameControllerDB"
PKG_URL="https://github.com/gabomdq/SDL_GameControllerDB/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET=""
PKG_LONGDESC="A community sourced database of game controller mappings to be used with SDL2 Game Controller functionality"
PKG_TOOLCHAIN="manual"

makeinstall_target() {
  mkdir -p $INSTALL/usr/config/SDL-GameControllerDB
  cp $PKG_BUILD/gamecontrollerdb.txt $INSTALL/usr/config/SDL-GameControllerDB
}
