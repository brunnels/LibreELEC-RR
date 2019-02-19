# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="vulkan-tools"
PKG_VERSION="089324fd189074b7e49b42703312125f86b36a96" # 1.1.100
PKG_SHA256="f04cefb9ef5cfee349571888faa53a65ffc831afe489e8eb91d8d7c0461ba3bd"
PKG_ARCH="x86_64"
PKG_LICENSE="Apache 2.0"
PKG_SITE="https://github.com/KhronosGroup/Vulkan-Tools"
PKG_URL="https://github.com/KhronosGroup/Vulkan-tools/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain cmake:host vulkan-loader"
PKG_LONGDESC="This project provides Vulkan tools and utilities that can assist development by enabling developers to verify their applications correct use of the Vulkan API."

pre_configure_target() {
  PKG_CMAKE_OPTS_TARGET="-DBUILD_ICD=Off \
                         -DINSTALL_ICD=Off"

  # Disable Wayland WSI support
  sed -e "s/Build Wayland WSI support\" ON/Build Wayland WSI support\" OFF/" -i $PKG_BUILD/cube/CMakeLists.txt
  sed -e "s/Build Wayland WSI support\" ON/Build Wayland WSI support\" OFF/" -i $PKG_BUILD/vulkaninfo/CMakeLists.txt
}

pre_make_target() {
  # Fix cross compiling
  find $PKG_BUILD -name flags.make -exec sed -i "s:isystem :I:g" \{} \;
  find $PKG_BUILD -name build.ninja -exec sed -i "s:isystem :I:g" \{} \;
}
