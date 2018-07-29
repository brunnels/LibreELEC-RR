# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="vulkan-loader"
PKG_VERSION="cb1f186"
PKG_SHA256="109430a494d7e5bee25eb174d8dc6a4148377ff4533db6e8a71b80e977db4a22"
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

