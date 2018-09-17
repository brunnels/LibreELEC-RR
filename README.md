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
* Raspberry Pi 2B, 3B, 3B+

*Currently unsupported:*

* Amlogic based devices so S905X and others -> WIP! Once I get my test device in the hands I start to test and probably upload AML builds too. The code has already been changed and updated to build these images but real world testing is needed.
* Rockchip based devices -> need a testing device first

---
**Basics**

* [LibreELEC 9.0-devel](https://github.com/LibreELEC/LibreELEC.tv)
* [Kodi 18](https://github.com/xbmc/xbmc) - git 7868a27 | Beta 2
* [Linux 4.18.8](https://www.kernel.org/) - generic x86-64 builds
* [Linux 4.18.7](https://github.com/raspberrypi/linux) - RPi2 & RPi3 builds 
---
**Addons & tools**

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
* [Intel-video](https://cgit.freedesktop.org/xorg/driver/xf86-video-intel/) - git 25c9a2f
* [Intel](https://downloadcenter.intel.com/download/28087/Linux-Processor-Microcode-Data-File) - µcode 2018-08-07
* [Nvidia](https://www.nvidia.com/Download/driverResults.aspx/134859/en-us) - v396.54
* [Nvidia-legacy](https://www.nvidia.com/Download/driverResults.aspx/135161/en-us) - v340.107
---
**Updated drivers & daemons**

* [GCC](https://gcc.gnu.org/gcc-8/changes.html) - v8.2
* [glibc](https://sourceware.org/glibc/wiki/Release/2.28) - v2.28
* [LLVM](https://llvm.org/) - v6.0.1
* [Mesa 3D](https://www.mesa3d.org/) - v18.2.0
* [Vulkan-Loader](https://github.com/KhronosGroup/Vulkan-Loader) - v1.1.84
* [openssl](https://www.openssl.org/source/) - v1.0.2p
* [PulseAudio](https://www.freedesktop.org/wiki/Software/PulseAudio/) - 12.2
* [Samba](https://www.samba.org/samba/history/samba-4.8.2.html) - v4.9.0
* [systemd](https://github.com/systemd/systemd) - v239
* [Qt](https://blog.qt.io/blog/2018/06/19/qt-5-11-1-released/) - v5.11.1
* [Xorg-Server](https://cgit.freedesktop.org/xorg/xserver/log/) - v1.20.1
---
**Emulator Frontends**

* [Emulationstation-Retropie](https://github.com/RetroPie/EmulationStation) - v2.8-DEV + [Steven Selph's Scraper](https://github.com/sselph/scraper) - v1.4.6
* [RetroArch](https://github.com/libretro/RetroArch) - v1.7.4
---
**Emulators included in generic x86-64 & RPi builds**

*  [dosbox-sdl2](https://github.com/duganchen/dosbox) - git 8f8d0c5 | DOS
*  [moonlight-embedded](https://github.com/irtimmer/moonlight-embedded) - git 9b0b2d4 | v2.4.6 | NVIDIA GameStream client
*  [PPSSPP](https://github.com/hrydgard/ppsspp) - git fd6c314 | v1.7.0-dev | Sony PSP
*  [libretro-2048](https://github.com/libretro/libretro-2048) - git 8284300 | 2048
*  [libretro-beetle-wswan](https://github.com/libretro/beetle-wswan-libretro) - git bdaeae6 | Bandai WonderSwan
*  [libretro-dosbox](https://github.com/libretro/dosbox-libretro) - git c35d4cc | DOS
*  [libretro-fbalpha](https://github.com/libretro/fbalpha) - git 6f85b5d | Multiple Arcade Machine Emulator
*  [libretro-fceumm](https://github.com/libretro/libretro-fceumm) - git a37c3bc | Nintendo Entertainment System
*  [libretro-fuse](https://github.com/libretro/fuse-libretro) - git 69a4442 | ZX Spectrum
*  [libretro-gambatte](https://github.com/libretro/gambatte-libretro) - git 7722012 | Nintendo Game Boy (Color)
*  [libretro-genplus](https://github.com/libretro/Genesis-Plus-GX) - git 7856b72 | Sega Mega Drive
*  [libretro-mame2003-plus](https://github.com/libretro/mame2003-plus-libretro) - git d8f7372 | Romset 0.78 | Multiple Arcade Machine Emulator
*  [libretro-mgba](https://github.com/libretro/mgba) - git 144dbd2 | Nintendo Game Boy Advance
*  [libretro-mrboom](https://github.com/libretro/mrboom-libretro) - git 2865840 | v4.5 | Bomberman clone
*  [libretro-mupen64plus](https://github.com/libretro/mupen64plus-libretro) - git 4ca2fa8 | Nintendo N64
*  [libretro-nestopia](https://github.com/libretro/nestopia) - git faf19f8 | Nintendo Entertainment System
*  [libretro-pcsx-rearmed](https://github.com/libretro/pcsx_rearmed) - git 0370856 | Sony Playstation
*  [libretro-prboom](https://github.com/libretro/libretro-prboom) - git 3ff6c1c | Doom Clone
*  [libretro-reicast](https://github.com/libretro/reicast-emulator) - git 514c569 | Sega Dreamcast
*  [libretro-scummvm](https://github.com/libretro/scummvm) - git 60c47ac | Engine for LucasArts adventure games
*  [libretro-tyrquake](https://github.com/libretro/tyrquake) - git 5aa8c55 | Quake Clone
---
**Emulators included in generic x86-64 builds**

*  [Dolphin](https://de.dolphin-emu.org/?cr=de) - git 755ae5d8 | r5.0-8718 | [Qt GUI](https://de.dolphin-emu.org/blog/2018/02/03/dolphin-progress-report-january-2018/) | Nintendo Wii / Gamecube
*  [fs-uae](https://fs-uae.net/) - git 3d6a8dc | 2.9.7dev4 | Commodore Amiga
*  [PCSX2 ](https://github.com/PCSX2/pcsx2) - git 5b9e93c | v1.5.0-dev | Docker addon needed | Sony PlayStation 2
*  [Vice](http://vice-emu.sourceforge.net/amigaos.html) - v3.2-release | Commodore C64
*  [libretro-beetle-psx](https://github.com/libretro/beetle-psx-libretro) - git 6a804da | Sony Playstation
*  [libretro-beetle-saturn](https://github.com/libretro/beetle-saturn-libretro) - git 1983713 | Sega Saturn
*  [libretro-bsnes-mercury](https://github.com/libretro/bsnes-mercury) git 4e221df | Nintendo Super Nintendo Entertainment System
*  [libretro-citra](https://github.com/libretro/citra) - git 5d8e36a | Nintendo 3DS
*  [libretro-desmume](https://github.com/libretro/desmume) - git 07162f4 | Nintendo DS
*  [libretro-dolphin](https://github.com/libretro/dolphin) - git a5bce7d | Nintendo Wii / Gamecube
*  [libretro-ishiiruka](https://github.com/libretro/Ishiiruka) - git ede0713 | Nintendo Wii / Gamecube
*  [libretro-mame2016](https://github.com/libretro/mame2016-libretro) - git e06d731 | Romset 0.174 | Multiple Arcade Machine Emulator
*  [libretro-mesen](https://github.com/SourMesen/Mesen) - git e72f837 | Nintendo Entertainment System
*  [libretro-parallel-n64](https://github.com/libretro/parallel-n64) - git ab155da | Nintendo N64
*  [libretro-snes9x](https://github.com/libretro/snes9x) - git 4432700 | Nintendo Super Nintendo Entertainment System
---
**Emulators included in RPi2 & RPi3 builds**

*  [amiberry](https://github.com/midwan/amiberry) - git b6e62ba | v2.21+ | Commodore Amiga
*  [libretro-snes9x2010](https://github.com/libretro/snes9x2010) - git 1b5ec5b | Nintendo Super Nintendo Entertainment System
*  [libretro-vice](https://github.com/libretro/vice-libretro) - git b419dd8 | Commodore C64
*  [libretro-yabause](https://github.com/libretro/yabause)  - git fae9682 | Sega Saturn

---
**Downloads**

*  [LibreELEC 9.0-RR files](https://goo.gl/UcMon6)
*  [Generic x86-64 builds](https://goo.gl/GXda1W)
*  [RaspberryPi (RPi2 | RPi3) builds](https://goo.gl/ESZVGd)

---
**Builds systems**

I use VirtualBox v5.2.18 to run a Linux Mint 19 Mate VM as building system. So this distribution should be suitable for you too. For further information see [LibreELEC Wiki / Compile](https://wiki.libreelec.tv/compile).

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
For Khadas VIM use:
```
PROJECT=Amlogic DEVICE=KVIM ARCH=arm BUILD_PERIODIC=RR BUILDER_NAME=5schatten BUILDER_VERSION=XXX make image
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
(amiga|c64|dos|dreamcast|fba|gamecube|gba|genesis|mame|n3ds|n64|nes|nds|psp|psx|snes|saturn|wii|wonderswan|zxspectrum)
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
Emulationstation menu = RCTRL
Emulationstation exit = Alt+F4
Dolphin exit = Alt+Esc
uae4arm menu = F12
uae4arm joystick/mouse switch = F11
VICE menu = F12
Retroarch menu = F1
Spotify exit = Alt+Esc
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
