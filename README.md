## LibreELEC 9.0 Reborn Remix
---
**Project threads**

*English*

* [LibreELEC 9.0 Reborn Remix [ Emulationstation | Retroarch | DolphinQT | Moonlight | Chrome | Spotify | MakeMKV ]](https://forum.libreelec.tv/thread/12662-libreelec-9-0-reborn-remix-emulationstation-retroarch-dolphinqt-chrome-spotify-w/)

*German*

* [LibreELEC 9.0 Reborn Remix [ Emulationstation | Retroarch | DolphinQT | Moonlight | Chrome | Spotify | MakeMKV ]](https://www.kodinerds.net/index.php/Thread/62933-LibreELEC-9-0-Reborn-Remix-Emulationstation-Retroarch-DolphinQT-Moonlight-Chrome/)

---
**Currently supported & unsupported devices**

*Supported:*

* Generic AMD & Intel systems with IGP and/or discrete AMD or Nvidia GPU
* Amlogic S905
* Khadas Vim
* Odroid C2
* Raspberry Pi 2B, 3B, 3B+

*Currently unsupported:*

* Rockchip based devices -> need a testing device first

---
**Basics**

* [LibreELEC 9.0-devel](https://github.com/LibreELEC/LibreELEC.tv)
* [Kodi 18](https://github.com/xbmc/xbmc) - git 9d3a68a | Beta 4
* [Linux 4.18.16](https://www.kernel.org/) - generic x86-64 builds
* [Linux 3.14.29](https://www.kernel.org/) - Khadas Vim builds
* [Linux 4.18.16](https://github.com/raspberrypi/linux) - RPi2 & RPi3 builds 
---
**Addons & tools for generic builds**

* [Google Chrome](https://www.google.de/chrome/index.html) - latest | autoupdate script
* [Spotify](https://www.spotify.com/nl/download/linux/) - latest | autoupdate script
---
**Minor features**

* Updated "51-these-are-not-joysticks.rules" udev rules for input devices
* Increased system partion size to 1024MB for new installations
* [spectre-meltdown-checker](https://github.com/speed47/spectre-meltdown-checker) - > open a terminal and run sm-checker to check if you're vulnerable
---
**Updated driver versions**

* [AMDGPU](https://cgit.freedesktop.org/xorg/driver/xf86-video-amdgpu/) - v18.1.0
* [ATI](https://cgit.freedesktop.org/xorg/driver/xf86-video-ati) - v18.1.0
* [Intel-video](https://cgit.freedesktop.org/xorg/driver/xf86-video-intel/) - git 0932a6b
* [Intel](https://downloadcenter.intel.com/download/28087/Linux-Processor-Microcode-Data-File) - µcode 2018-08-07a
* [Nvidia](https://www.nvidia.com/Download/driverResults.aspx/134859/en-us) - v410.73
* [Nvidia-legacy](https://www.nvidia.com/Download/driverResults.aspx/135161/en-us) - v340.107
---
**Updated drivers & daemons**

* [GCC](https://gcc.gnu.org/gcc-8/changes.html) - v8.2
* [glibc](https://sourceware.org/glibc/wiki/Release/2.28) - v2.28
* [LLVM](https://llvm.org/) - v7.0.0
* [Mesa 3D](https://www.mesa3d.org/) - v18.2.3
* [Vulkan-Loader](https://github.com/KhronosGroup/Vulkan-Loader) - v1.1.89
* [openssl](https://www.openssl.org/source/) - v1.0.2p
* [PulseAudio](https://www.freedesktop.org/wiki/Software/PulseAudio/) - 12.2
* [Samba](https://www.samba.org/samba/history/samba-4.9.1.html) - v4.9.1
* [SDL2](https://github.com/spurious/SDL-mirror) - git 678ba78 | v2.0.9-dev
* [systemd](https://github.com/systemd/systemd) - v239
* [Qt](https://wiki.qt.io/Qt_5.11_Release) - v5.11.2
* [Xorg-Server](https://cgit.freedesktop.org/xorg/xserver/log/) - v1.20.3
---
**Emulator Frontends**

* [Emulationstation-Retropie](https://github.com/RetroPie/EmulationStation) - v2.8-DEV + [Steven Selph's Scraper](https://github.com/sselph/scraper) - v1.4.6
* [RetroArch](https://github.com/libretro/RetroArch) - v1.7.5-dev
---
**Emulators included in all builds**

*  [dosbox-sdl2](https://github.com/duganchen/dosbox) - git 8f8d0c5 | DOS
*  [hatari](https://github.com/hatari/hatari) - git 31028b8 | v2.1.0 | Atari ST/STE/TT/Falcon
*  [moonlight-embedded](https://github.com/irtimmer/moonlight-embedded) - git e21e207 | v2.4.6 | NVIDIA GameStream client
*  [PPSSPP](https://github.com/hrydgard/ppsspp) - git caa506b | v1.7.0 | Sony PSP
*  [libretro-2048](https://github.com/libretro/libretro-2048) - git 8284300 | 2048
*  [libretro-atari800](https://github.com/libretro/libretro-atari800) - git b3931bb | Atari 5200
*  [libretro-beetle-pce-fast](https://github.com/libretro/beetle-pce-fast-libretro) - git  7f6f061 | PC-Engine
*  [libretro-beetle-wswan](https://github.com/libretro/beetle-wswan-libretro) - git b4dc85b | Bandai WonderSwan
*  [libretro-blueMSX](https://github.com/libretro/blueMSX-libretro) - git 4be0a24 | MSX
*  [libretro-dosbox](https://github.com/libretro/dosbox-libretro) - git 8f2d731 | DOS
*  [libretro-fbalpha](https://github.com/libretro/fbalpha) - git 92ab7c6 | Multiple Arcade Machine Emulator
*  [libretro-fceumm](https://github.com/libretro/libretro-fceumm) - git eb17f88 | Nintendo Entertainment System
*  [libretro-fuse](https://github.com/libretro/fuse-libretro) - git 69a4442 | ZX Spectrum
*  [libretro-gambatte](https://github.com/libretro/gambatte-libretro) - git 5ee8b1e | Nintendo Game Boy (Color)
*  [libretro-genplus](https://github.com/libretro/Genesis-Plus-GX) - git 7d0c04c | Sega Mega Drive
*  [libretro-mame2003-plus](https://github.com/libretro/mame2003-plus-libretro) - git 111249e | Romset 0.78 | Multiple Arcade Machine Emulator
*  [libretro-mgba](https://github.com/libretro/mgba) - git 0a79981 | Nintendo Game Boy Advance
*  [libretro-mrboom](https://github.com/libretro/mrboom-libretro) - git 2865840 | v4.5 | Bomberman clone
*  [libretro-mupen64plus](https://github.com/libretro/mupen64plus-libretro) - git e7ea1ae | Nintendo N64
*  [libretro-nestopia](https://github.com/libretro/nestopia) - git 69d0ca1 | Nintendo Entertainment System
*  [libretro-pcsx-rearmed](https://github.com/libretro/pcsx_rearmed) - git 0370856 | Sony Playstation
*  [libretro-prboom](https://github.com/libretro/libretro-prboom) - git 3ff6c1c | Doom Clone
*  [libretro-reicast](https://github.com/libretro/reicast-emulator) - git d7c47cd | Sega Dreamcast
*  [libretro-scummvm](https://github.com/libretro/scummvm) - git 0daf2f4 | Engine for LucasArts adventure games
*  [libretro-stella](https://github.com/libretro/stella-libretro) - git 3ed8154 | Atari 2600
*  [libretro-tyrquake](https://github.com/libretro/tyrquake) - git 7d18c40 | Quake Clone
---
**Emulators included in generic x86-64 builds**

*  [citra](https://github.com/citra-emu/citra) - git 902f7b5 | QT GUI | Nintendo 3DS
*  [Dolphin](https://de.dolphin-emu.org/?cr=de) - git 0140009 | r5.0-8983| [Qt GUI](https://de.dolphin-emu.org/blog/2018/02/03/dolphin-progress-report-january-2018/) | Nintendo Wii / Gamecube
*  [fs-uae](https://fs-uae.net/) - git 3d6a8dc | 2.9.7dev4 | Commodore Amiga
*  [PCSX2 ](https://github.com/PCSX2/pcsx2) - git 5b9e93c | v1.5.0-dev | Docker addon needed | Sony PlayStation 2
*  [Vice](http://vice-emu.sourceforge.net/amigaos.html) - v3.2-release | Commodore C64
*  [libretro-beetle-psx](https://github.com/libretro/beetle-psx-libretro) - git a38aa45 | Sony Playstation
*  [libretro-beetle-saturn](https://github.com/libretro/beetle-saturn-libretro) - git 1983713 | Sega Saturn
*  [libretro-bsnes-mercury](https://github.com/libretro/bsnes-mercury) git 4e221df | Nintendo Super Nintendo Entertainment System
*  [libretro-chailove](https://github.com/libretro/libretro-chailove) - git 14e0a09 | 0.29.0 | 2D Game Framework with ChaiScript
*  [libretro-citra](https://github.com/libretro/citra) - git a0c222c | Nintendo 3DS
*  [libretro-desmume](https://github.com/libretro/desmume) - git 07162f4 | Nintendo DS
*  [libretro-dolphin](https://github.com/libretro/dolphin) - git a5bce7d | Nintendo Wii / Gamecube
*  [libretro-ishiiruka](https://github.com/libretro/Ishiiruka) - git ede0713 | Nintendo Wii / Gamecube
*  [libretro-mame2016](https://github.com/libretro/mame2016-libretro) - git e06d731 | Romset 0.174 | Multiple Arcade Machine Emulator
*  [libretro-mesen](https://github.com/SourMesen/Mesen) - git f2af2ba | v0.9.7 | Nintendo Entertainment System
*  [libretro-parallel-n64](https://github.com/libretro/parallel-n64) - git 376e16f | Nintendo N64
*  [libretro-snes9x](https://github.com/libretro/snes9x) - git d7ebfaa | Nintendo Super Nintendo Entertainment System
---
**Emulators included in Amlogic S905 | Khadas Vim | Odroid C2 builds**

*  [amiberry](https://github.com/midwan/amiberry) - git 5c30945 | v2.24+ | Commodore Amiga
*  [libretro-mame2010](https://github.com/libretro/mame2010-libretro) - git 70732f9 | Romset 0.139 | Multiple Arcade Machine Emulator
*  [libretro-snes9x2010](https://github.com/libretro/snes9x2010) - git d857a31 | Nintendo Super Nintendo Entertainment System
*  [libretro-vice](https://github.com/libretro/vice-libretro) - git b35a177 | Commodore C64
*  [libretro-yabause](https://github.com/libretro/yabause)  - git aa15301 | Sega Saturn
---
**Emulators included in RPi2 & RPi3 builds**

*  [amiberry](https://github.com/midwan/amiberry) - git 5c30945 | v2.24+ | Commodore Amiga
*  [libretro-mame2010](https://github.com/libretro/mame2010-libretro) - git 70732f9 | Romset 0.139 | Multiple Arcade Machine Emulator
*  [libretro-snes9x2010](https://github.com/libretro/snes9x2010) - git d857a31 | Nintendo Super Nintendo Entertainment System
*  [libretro-vice](https://github.com/libretro/vice-libretro) - git b35a177 | Commodore C64
*  [libretro-yabause](https://github.com/libretro/yabause)  - git aa15301 | Sega Saturn

---
**Builds systems**

I use VirtualBox v5.2.20 to run a Linux Mint 19 Mate VM as building system. So this distribution should be suitable for you too. For further information see [LibreELEC Wiki / Compile](https://wiki.libreelec.tv/compile).

---
**Build dependencies**

This should be handled automatically by the build script.

---
**Download package source code (optional)**

This command starts the download of all the source code packages you'll need for the build process. You can skip this and the source code is downloaded right before each package is build.

For generic x86-64 Intel & AMD CPU use:
```
PROJECT=Generic ARCH=x86_64 tools/download-tool
```
For Raspberry Pi (RPi2 & RPi3) use:
```
PROJECT=RPi DEVICE=RPi2 ARCH=arm tools/download-tool
```
---

**Build commands**

For generic x86-64 Intel & AMD CPU use:
```
PROJECT=Generic ARCH=x86_64 BUILD_PERIODIC=RR BUILDER_NAME=5schatten BUILDER_VERSION=XXX make image
```
For Raspberry Pi (RPi2 & RPi3) use:
```
PROJECT=RPi DEVICE=RPi2 ARCH=arm BUILD_PERIODIC=RR BUILDER_NAME=5schatten BUILDER_VERSION=XXX make image
```
For Amlogic S905 use:
```
PROJECT=Amlogic DEVICE=S905 ARCH=arm BUILD_PERIODIC=RR BUILDER_NAME=5schatten BUILDER_VERSION=XXX make image
```
For Khadas VIM use:
```
PROJECT=Amlogic DEVICE=KVIM ARCH=arm BUILD_PERIODIC=RR BUILDER_NAME=5schatten BUILDER_VERSION=XXX make image
```
For Odroid C2 use:
```
PROJECT=Amlogic DEVICE=Odroid_C2 ARCH=arm BUILD_PERIODIC=RR BUILDER_NAME=5schatten BUILDER_VERSION=XXX make image
```
To build single packages use:
```
scripts/build "package"
```
In example for package linux:
```
PROJECT=Generic ARCH=x86_64 scripts/build linux
```
---

**Clean up**

In case the build process fails try this and build again:

```
scripts/clean "package"
```
i.e. this cleans the linux package:
```
PROJECT=Generic ARCH=x86_64 scripts/clean linux
```

If you want to start a clean build:

```
make clean
```
If you want to start a clean build without buildcache:

```
make distclean
```
---
**Emulationstation configuration** 

path to config file:
```
/storage/.config/emulationstation/emulationstation.conf
```
**Out of the box Emulationstation will look for roms in**

```
/storage/roms/...
(amiga|c64|dos|dreamcast|fba|gamecube|gb|gba|genesis|mame|n3ds|n64|nes|nds|ps2|psp|psx|snes|saturn|wii|wonderswan|zxspectrum)
```

**BIOS files should be put in**

```
/storage/roms/bios
```
**The keyboard layout is as follows:**

```
Navigation = Arrow keys
A = Enter
B = Backspace
Page up = ,
Page down = .
Start = ctrl
Select = ralt
```

**Keyboard buttons in different apps**
```
Kodi shutdown menu = S
Kodi context menu = C
Spotify exit = Alt+Esc
Emulationstation menu = AltGR
Emulationstation exit = Alt+F4
Retroarch menu = F1
Retroarch exit = AltGR
Dolphin exit = Alt+Esc
PCSX2 exit = Alt+Esc
Amiberry menu = F12
Amiberry joystick/mouse switch = F11
FS-UAE menu = F12
Hatari menu = F12
Hatari floppy menu = AltGR+D
Hatari quit = AltGR+Q
VICE menu = F12
```
---
**Issues**

Visit the [LibreELEC 9 Remix issue page](https://github.com/thinksupervised/LibreELEC.tv/issues) or [LibreELEC 9.0 Reborn Remix [Emulationstation|Retroarch|DolphinQT |Chrome|Spotify]](https://forum.libreelec.tv/thread/12662-libreelec-9-0-reborn-remix-emulationstation-retroarch-dolphinqt-chrome-spotify-w/)  for issues pertaining to this specific fork. 

For everything else, see the [LibreELEC Forum](https://forum.libreelec.tv).

---
**Original README below:**

---
**LibreELEC**

LibreELEC is a 'Just enough OS' Linux distribution for running the award-winning [Kodi](https://kodi.tv) software on popular mediacentre hardware. LibreELEC is a conservative fork of the popular [OpenELEC](http://openelec.tv) project with a stronger focus on pre-release testing and post-release change management. Further information on the project can be found on the [LibreELEC website](https://libreelec.tv).

**Issues & Support**

Please report issues via the [LibreELEC forum: Bug Reports](https://forum.libreelec.tv/forum-35.html). Please ask support questions in the [LibreELEC forum: Help & Support](https://forum.libreelec.tv/forum-3.html) or ask a member of project staff in the #libreelec IRC channel on Freenode.

**Donations**

Contributions towards current project funding goals can be sent via PayPal to donations@libreelec.tv

**License**

LibreELEC original code is released under [GPLv2](https://www.gnu.org/licenses/gpl-2.0.html).

**Copyright**

As LibreELEC includes code from many upstream projects it includes many copyright owners. LibreELEC makes NO claim of copyright on any upstream code. However all original LibreELEC authored code is copyright LibreELEC.tv. Patches to upstream code have the same license as the upstream project, unless specified otherwise. For a complete copyright list please checkout the source code to examine license headers. Unless expressly stated otherwise all code submitted to the LibreELEC project (in any form) is licensed under [GPLv2](https://www.gnu.org/licenses/gpl-2.0.html) and copyright is donated to LibreELEC.tv. This approach allows the project to stay manageable in the long term by giving us freedom to maintain the code as part of the whole without the management overhead of preserving contact with every submitter, e.g. GPLv3. You are absolutely free to retain copyright. To retain copyright simply add a copyright header to each submitted code page. If you submit code that is not your own work it is your responsibility to place a header stating the copyright.
