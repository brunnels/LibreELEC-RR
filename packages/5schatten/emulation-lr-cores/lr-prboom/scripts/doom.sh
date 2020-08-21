#!/bin/sh
# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2018-present Frank Hartung (supervisedthinking@gmail.com)

. /etc/profile

# Freeze Kodi / stop audio
kodifreeze.sh freeze

# Change refresh rate to 60Hz
set_refresh_rate_60

# Set audio backend to PulseAudio or ALSA
set_SDL_audiodriver

/usr/bin/retroarch.start -L /tmp/cores/prboom_libretro.so "/storage/roms/prboom/"*"oom/doom.wad"

# Switch back to Frontends or unfreeze Kodi & start audio
pidof emulationstation > /dev/null 2>&1 || pidof pegasus-fe > /dev/null 2>&1 || kodifreeze.sh unfreeze
