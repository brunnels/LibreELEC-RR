#!/bin/sh
# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

. /etc/profile

if [ ! -L /storage/.yq2 ]; then
  ln -s /storage/.config/games/yquake2 /storage/.yq2
fi

# Freeze Kodi / stop audio
kodifreeze.sh freeze

# Set SDL audio driver to ALSA
export SDL_AUDIODRIVER=alsa

quake2 "$@" > /var/log/yquake2.log 2>&1

# Switch back to ES or unfreeze Kodi & start audio
pidof emulationstation > /dev/null 2>&1 || kodifreeze.sh unfreeze
