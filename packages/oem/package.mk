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

OEM_APPS_AMLOGIC=""

OEM_APPS_GENERIC=" \
  dmidecode \
  google-chrome \
  smartmontools \
  spotify \
  tigervnc-system"

OEM_APPS_RPI=""

OEM_EMU_COMMON=" \
  emulationstation-retropie \
  retroarch \
  dosbox-sdl2 \
  hatari \
  moonlight-embedded \
  ppsspp \
  lr-2048 \
  lr-atari800 \
  lr-beetle-pce-fast \
  lr-beetle-wswan \
  lr-bluemsx \
  lr-chailove \
  lr-dosbox \
  lr-fbalpha2018 \
  lr-fceumm \
  lr-fuse \
  lr-gambatte \
  lr-genplus \
  lr-mame2003-plus \
  lr-mgba \
  lr-mrboom \
  lr-mupen64plus \
  lr-nestopia \
  lr-pcsx-rearmed \
  lr-prboom \
  lr-reicast \
  lr-samples \
  lr-scummvm \
  lr-stella \
  lr-tyrquake"

OEM_EMU_AMLOGIC=" \
  amiberry \
  lr-mame2010 \
  lr-snes9x2010 \
  lr-vice \
  lr-yabause"

OEM_EMU_GENERIC=" \
  citra \
  dolphin \
  fs-uae \
  mupen64plus \
  PCSX2 \
  vice \
  yquake2 \
  lr-beetle-psx \
  lr-beetle-saturn \
  lr-bsnes-mercury-accuracy \
  lr-citra \
  lr-desmume \
  lr-dolphin \
  lr-ishiiruka \
  lr-mame2016 \
  lr-mesen \
  lr-parallel-n64 \
  lr-snes9x"

OEM_EMU_RPI=" \
  amiberry \
  lr-mame2010 \
  lr-snes9x2010 \
  lr-vice \
  lr-yabause"

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
  cp -PR $PKG_DIR/files/common/* $INSTALL
  cp -PR $PKG_DIR/files/$PROJECT/* $INSTALL
}
