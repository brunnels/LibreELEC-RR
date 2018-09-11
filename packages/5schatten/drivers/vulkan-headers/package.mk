# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="vulkan-headers"
PKG_VERSION="241c515"
#PKG_SHA256="1ceeeb89b7659c038d4580aeb145cb41bf6d20c717d4641549890ca409238ebb"
PKG_ARCH="any"
PKG_LICENSE="Apache 2.0"
PKG_SITE="https://github.com/KhronosGroup/Vulkan-Headers"
PKG_URL="https://github.com/KhronosGroup/Vulkan-Headers/archive/$PKG_VERSION.tar.gz"
PKG_SOURCE_DIR="Vulkan-Headers-*$PKG_VERSION*"
PKG_DEPENDS_TARGET="toolchain cmake:host"
PKG_SECTION="emulation/drivers"
PKG_SHORTDESC="Vulkan Header files and API registry"
