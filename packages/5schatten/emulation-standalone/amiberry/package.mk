# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2018-present Frank Hartung (supervisedthinking (@) gmail.com)

PKG_NAME="amiberry"
PKG_VERSION="99d1b64852c770dce70b05a44547ac3c712cae57" # v2.25+
PKG_ARCH="arm"
PKG_LICENSE="GPLv3"
PKG_SITE="https://github.com/midwan/amiberry"
PKG_URL="https://github.com/midwan/amiberry.git"
PKG_DEPENDS_TARGET="toolchain linux glibc bzip2 zlib SDL2-git SDL2_image SDL2_ttf capsimg freetype libxml2 flac libogg mpg123-compat libpng libmpeg2 retroarch-joypad-autoconfig"
PKG_LONGDESC="Amiberry is an optimized Amiga emulator for ARM-based boards."
GET_HANDLER_SUPPORT="git"
PKG_TOOLCHAIN="make"

PKG_MAKE_OPTS_TARGET="all"

configure_package() {
  if [ "${TARGET_SUBARCH}" = "armv8-a" ] || [ "${TARGET_SUBARCH}" = "armv7ve" ]; then
    PKG_BUILD_FLAGS="+lto"
  fi
}

pre_configure_target() {
  cd ${PKG_BUILD}
  export SYSROOT_PREFIX=${SYSROOT_PREFIX}

  case ${PROJECT} in
    Amlogic)
      AMIBERRY_PLATFORM="amlogic"
      ;;
    Rockchip)
      if [ "${DEVICE}" = "RK3399" ]; then
        AMIBERRY_PLATFORM="rockpro64"
      else
        AMIBERRY_PLATFORM="tinker"
      fi
      ;;
    RPi)
      if [ "${DEVICE}" = "RPi2" ]; then
        AMIBERRY_PLATFORM="rpi2-sdl2"
      else
        AMIBERRY_PLATFORM="rpi1-sdl2"
      fi
      ;;
  esac

  PKG_MAKE_OPTS_TARGET+=" PLATFORM=${AMIBERRY_PLATFORM}"
}

makeinstall_target() {
  # Create directories
  mkdir -p ${INSTALL}/usr/bin
  mkdir -p ${INSTALL}/usr/lib
  mkdir -p ${INSTALL}/usr/config/amiberry/controller

  # Copy ressources
  cp -a ${PKG_DIR}/config/*           ${INSTALL}/usr/config/amiberry/
  cp -a data                          ${INSTALL}/usr/config/amiberry/
  cp -a savestates                    ${INSTALL}/usr/config/amiberry/
  cp -a screenshots                   ${INSTALL}/usr/config/amiberry/
  cp -a whdboot                       ${INSTALL}/usr/config/amiberry/
  ln -s /storage/roms/bios/Kickstarts ${INSTALL}/usr/config/amiberry/kickstarts

  # Create links to Retroarch controller files
  ln -s /usr/share/retroarch/autoconfig/udev/8Bitdo_Pro_SF30_BT_B.cfg "${INSTALL}/usr/config/amiberry/controller/8Bitdo SF30 Pro.cfg"
  ln -s "/usr/share/retroarch/autoconfig/udev/Pro Controller.cfg"     "${INSTALL}/usr/config/amiberry/controller/Pro Controller.cfg"

  # Copy binary, scripts & link libcapsimg
  cp -av amiberry-${AMIBERRY_PLATFORM} ${INSTALL}/usr/bin/amiberry
  cp -a ${PKG_DIR}/scripts/*           ${INSTALL}/usr/bin
  ln -sf /usr/lib/libcapsimage.so.5.1  ${INSTALL}/usr/config/amiberry/capsimg.so
}
