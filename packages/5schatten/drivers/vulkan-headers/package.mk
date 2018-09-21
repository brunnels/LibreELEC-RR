# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="vulkan-headers"
PKG_VERSION="2fd5a24"
PKG_SHA256="073451c821f00509ef1f18b3d672b2ef595bcd49844e0b180e0f2045f9a2f166"
PKG_ARCH="any"
PKG_LICENSE="Apache 2.0"
PKG_SITE="https://github.com/KhronosGroup/Vulkan-Headers"
PKG_URL="https://github.com/KhronosGroup/Vulkan-Headers/archive/$PKG_VERSION.tar.gz"
PKG_SOURCE_DIR="Vulkan-Headers-*$PKG_VERSION*"
PKG_DEPENDS_TARGET="toolchain cmake:host"
PKG_SECTION="emulation/drivers"
PKG_SHORTDESC="Vulkan Header files and API registry"
