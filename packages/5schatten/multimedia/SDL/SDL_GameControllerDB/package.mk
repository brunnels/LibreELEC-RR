# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2018-present Frank Hartung (supervisedthinking (@) gmail.com)

PKG_NAME="SDL_GameControllerDB"
PKG_VERSION="d57f56464971268ca0811b6ead1279b73f173a77"
PKG_SHA256="df28c216bb3fa4b80f46eeba61254621bf1879d69ce966acd6b2fa4c47d2c928"
PKG_LICENSE="OSS"
PKG_SITE="https://github.com/gabomdq/SDL_GameControllerDB"
PKG_URL="https://github.com/gabomdq/SDL_GameControllerDB/archive/${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET=""
PKG_LONGDESC="A community sourced database of game controller mappings to be used with SDL2 Game Controller functionality"
PKG_TOOLCHAIN="manual"

makeinstall_target() {
  PKG_INSTALL_PATH=${INSTALL}/usr/config/SDL-GameControllerDB
  mkdir -p ${PKG_INSTALL_PATH}
  cp -v gamecontrollerdb.txt ${PKG_INSTALL_PATH}
  # Clean up
  sed -e "/Windows/d" -i ${PKG_INSTALL_PATH}/gamecontrollerdb.txt
  sed -e "/Mac/d"     -i ${PKG_INSTALL_PATH}/gamecontrollerdb.txt
  sed -e "/Android/d" -i ${PKG_INSTALL_PATH}/gamecontrollerdb.txt
  sed -e "/iOS/d"     -i ${PKG_INSTALL_PATH}/gamecontrollerdb.txt
  sed -e "/^$/d"      -i ${PKG_INSTALL_PATH}/gamecontrollerdb.txt
}
