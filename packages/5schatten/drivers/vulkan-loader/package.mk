# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="vulkan-loader"
PKG_VERSION="6908e87"
PKG_SHA256="54a1d945fee85d3da51fd9abea851662d270b67faf56da8c4c066b55f6ac89ec"
PKG_ARCH="any"
PKG_LICENSE="Apache 2.0"
PKG_SITE="https://github.com/KhronosGroup/Vulkan-Loader"
PKG_URL="https://github.com/KhronosGroup/Vulkan-Loader/archive/$PKG_VERSION.tar.gz"
PKG_SOURCE_DIR="Vulkan-Loader*$PKG_VERSION*"
PKG_DEPENDS_TARGET="toolchain cmake:host vulkan-headers"
PKG_SECTION="emulation/drivers"
PKG_SHORTDESC="Vulkan Installable Client Driver (ICD) Loader."

PKG_CMAKE_OPTS_TARGET="-DBUILD_TESTS=Off \
                       -DBUILD_WSI_WAYLAND_SUPPORT=Off"

