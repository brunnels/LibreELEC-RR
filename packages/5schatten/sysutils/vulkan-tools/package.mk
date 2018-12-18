# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="vulkan-tools"
PKG_VERSION="2ec8a5cd9d7a0a90c841ef640f0628561211571e" # 1.1.95
PKG_SHA256="ca4f0ca53e66f58c218d695b1899079858fa09615ae329c04d4d0d36c2aad8a3"
PKG_ARCH="x86_64"
PKG_LICENSE="Apache 2.0"
PKG_SITE="https://github.com/KhronosGroup/Vulkan-Tools"
PKG_URL="https://github.com/KhronosGroup/Vulkan-tools/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain cmake:host vulkan-loader"
PKG_LONGDESC="This project provides Vulkan tools and utilities that can assist development by enabling developers to verify their applications correct use of the Vulkan API."
PKG_TOOLCHAIN="cmake-make"

PKG_CMAKE_OPTS_TARGET="-DBUILD_ICD=Off \
                       -DINSTALL_ICD=Off"

pre_configure_target() {
 sed -e "s/Build Wayland WSI support\" ON/Build Wayland WSI support\" OFF/" -i $PKG_BUILD/cube/CMakeLists.txt
 sed -e "s/Build Wayland WSI support\" ON/Build Wayland WSI support\" OFF/" -i $PKG_BUILD/vulkaninfo/CMakeLists.txt
}

pre_make_target() {
  # Fix stdlib.h error
  find . -name flags.make -exec sed -i "s:isystem :I:g" \{} \;
}
