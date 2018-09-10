# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)

PKG_NAME="oem"
PKG_VERSION=""
PKG_LICENSE="various"
PKG_SITE="http://www.libreelec.tv"
PKG_URL=""
PKG_DEPENDS_TARGET="toolchain $PROJECT"
PKG_SECTION="virtual"
PKG_LONGDESC="OEM: Metapackage for various OEM packages"

PKG_TOOLCHAIN="manual"

OEM_APPS_COMMON=" \
  ds4drv \
  htop \
  mc \
  sdl-jstest \
  spectre-meltdown-checker"

OEM_APPS_AMLOGIC=" \
  librespot"

OEM_APPS_GENERIC=" \
  dmidecode \
  google-chrome \
  smartmontools \
  spotify"

OEM_APPS_RPI=" \
  librespot"

OEM_EMU_COMMON=" \
  emulationstation-retropie \
  retroarch \
  dosbox-sdl2 \
  moonlight-embedded \
  ppsspp \
  libretro-2048 \
  libretro-beetle-wswan \
  libretro-dosbox \
  libretro-fbalpha \
  libretro-fceumm \
  libretro-fuse \
  libretro-gambatte \
  libretro-genplus \
  libretro-mame2003-plus \
  libretro-mgba \
  libretro-mrboom \
  libretro-mupen64plus \
  libretro-pcsx-rearmed \
  libretro-prboom \
  libretro-reicast \
  libretro-samples \
  libretro-scummvm \
  libretro-tyrquake"

OEM_EMU_AMLOGIC=" \
  amiberry \
  libretro-snes9x2010 \
  libretro-vice \
  libretro-yabause"

OEM_EMU_GENERIC=" \
  dolphin \
  fs-uae \
  PCSX2 \
  vice \
  libretro-beetle-psx \
  libretro-beetle-saturn \
  libretro-bsnes-mercury-accuracy \
  libretro-citra \
  libretro-desmume \
  libretro-dolphin \
  libretro-ishiiruka \
  libretro-mame2016 \
  libretro-mesen \
  libretro-parallel-n64 \
  libretro-snes9x"

OEM_EMU_RPI=" \
  amiberry \
  libretro-snes9x2010 \
  libretro-vice \
  libretro-yabause"

if [ "$OEM_APPS" == "yes" ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET $OEM_APPS_COMMON"
  case $PROJECT in
    Amlogic)
      PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET $OEM_APPS_AMLOGIC"
      ;;
    Generic)
      PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET $OEM_APPS_GENERIC"
      ;;
    RPi*)
      PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET $OEM_APPS_RPI"
      ;;
  esac
fi

if [ "$OEM_EMU" == "yes" ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET $OEM_EMU_COMMON"
  case $PROJECT in
    Amlogic)
      PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET $OEM_EMU_AMLOGIC"
      ;;
    Generic)
      PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET $OEM_EMU_GENERIC"
      ;;
    RPi*)
      PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET $OEM_EMU_RPI"
      ;;
  esac
fi

makeinstall_target() {
  mkdir -p $INSTALL
  cp -PR $PKG_DIR/files/* $INSTALL
}
