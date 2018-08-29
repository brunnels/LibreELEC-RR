# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 0riginally created by Escalade (https://github.com/escalade)
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="retroarch"
PKG_VERSION="a157f2e"
PKG_ARCH="any"
PKG_LICENSE="GPLv3"
PKG_SITE="https://github.com/libretro/RetroArch"
PKG_URL="https://github.com/libretro/RetroArch.git"
PKG_DEPENDS_TARGET="toolchain alsa-lib tinyalsa freetype zlib ffmpeg retroarch-assets retroarch-joypad-autoconfig libretro-common-shaders libretro-slang-shaders libretro-glsl-shaders libretro-core-info libretro-database"
PKG_SECTION="emulation"
PKG_SHORTDESC="Reference frontend for the libretro API."
PKG_LONGDESC="RetroArch is the reference frontend for the libretro API. Popular examples of implementations for this API includes videogame system emulators and game engines, but also more generalized 3D programs. These programs are instantiated as dynamic libraries. We refer to these as libretro cores."
GET_HANDLER_SUPPORT="git"

if [ "$OPENGLES_SUPPORT" = yes ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET $OPENGLES"
else
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET $OPENGL"
fi

if [ "$SAMBA_SUPPORT" = yes ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET samba"
fi

if [ "$AVAHI_DAEMON" = yes ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET avahi nss-mdns"
fi

if [ "$OPENGLES" == "no" ]; then
  RETROARCH_GL="--enable-kms --enable-vulkan"
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET mesa vulkan-loader"
elif [[ "$PROJECT" =~ "RPi" ]]; then
  RETROARCH_GL="--enable-opengles --disable-kms --enable-dispmanx"
  CFLAGS="$CFLAGS -I$SYSROOT_PREFIX/usr/include/interface/vcos/pthreads \
                  -I$SYSROOT_PREFIX/usr/include/interface/vmcs_host/linux"
elif [ "$OPENGLES" == "sunxi-mali" ] || [ "$OPENGLES" == "odroidc1-mali" ] || [ "$OPENGLES" == "odroidxu3-mali" ] || [ "$OPENGLES" == "opengl-meson6" ] || [ "$OPENGLES" == "opengl-meson8" ]; then
  RETROARCH_GL="--enable-opengles --disable-kms --enable-mali_fbdev"
elif [ "$OPENGLES" == "gpu-viv-bin-mx6q" ]; then
  RETROARCH_GL="--enable-opengles --disable-kms --enable-vivante_fbdev"
  CFLAGS="$CFLAGS -DLINUX -DEGL_API_FB"
fi

if [[ "$TARGET_FPU" =~ "neon" ]]; then
  RETROARCH_NEON="--enable-neon"
fi

if [[ "$PROJECT" =~ "Generic" ]]; then
  RETROARCH_QT="--enable-qt"
else
  RETROARCH_QT="--disable-qt"
fi

TARGET_CONFIGURE_OPTS=""
PKG_CONFIGURE_OPTS_TARGET="--disable-vg \
                           --disable-sdl \
                           --disable-xvideo \
                           --disable-al \
                           --disable-oss \
                           $RETROARCH_GL \
                           $RETROARCH_NEON \
                           $RETROARCH_QT \
                           --enable-zlib \
                           --host=$TARGET_NAME \
                           --enable-freetype"

pre_configure_target() {
  cd ..
  rm -rf .$TARGET_NAME
  export PKG_CONF_PATH=$TOOLCHAIN/bin/pkg-config
  echo $PKG_VERSION > .gitversion
}

make_target() {
  make V=1
  make -C gfx/video_filters compiler=$CC extra_flags="$CFLAGS"
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/bin
  mkdir -p $INSTALL/etc
    cp $PKG_BUILD/retroarch $INSTALL/usr/bin
    cp $PKG_BUILD/retroarch.cfg $INSTALL/etc
  mkdir -p $INSTALL/usr/share/retroarch/video_filters
    cp $PKG_BUILD/gfx/video_filters/*.so $INSTALL/usr/share/retroarch/video_filters
    cp $PKG_BUILD/gfx/video_filters/*.filt $INSTALL/usr/share/retroarch/video_filters
    cp $PKG_DIR/scripts/* $INSTALL/usr/bin

  if [[ "$PROJECT" =~ "Generic" ]]; then
    mkdir -p $INSTALL/usr/config/retroarch
    cp -PR $PKG_DIR/config/* $INSTALL/usr/config/retroarch/
  fi
  
  # General configuration
  sed -i -e "s/# savefile_directory =/savefile_directory = \/storage\/.config\/retroarch\/saves/" $INSTALL/etc/retroarch.cfg
  sed -i -e "s/# screenshot_directory =/screenshot_directory = \"\/storage\/screenshots\"/" $INSTALL/etc/retroarch.cfg
  sed -i -e "s/# libretro_directory =/libretro_directory = \"\/tmp\/cores\"/" $INSTALL/etc/retroarch.cfg
  sed -i -e "s/# libretro_info_path =/libretro_info_path = \"\/tmp\/cores\"/" $INSTALL/etc/retroarch.cfg
  sed -i -e "s/# content_database_path =/content_database_path =\/tmp\/database\/rdb/" $INSTALL/etc/retroarch.cfg
  sed -i -e "s/# cheat_database_path =/cheat_database_path =\/tmp\/database\/cht/" $INSTALL/etc/retroarch.cfg
  sed -i -e "s/# rgui_browser_directory =/rgui_browser_directory =\/storage\/roms/" $INSTALL/etc/retroarch.cfg
  sed -i -e "s/# video_shader_dir =/video_shader_dir =\/tmp\/shaders/" $INSTALL/etc/retroarch.cfg
  sed -i -e "s/# rgui_show_start_screen = true/rgui_show_start_screen = false/" $INSTALL/etc/retroarch.cfg
  sed -i -e "s/# assets_directory =/assets_directory =\/tmp\/assets/" $INSTALL/etc/retroarch.cfg
  sed -i -e "s/# menu_driver = \"rgui\"/menu_driver = \"xmb\"/" $INSTALL/etc/retroarch.cfg
  sed -i -e "s/# video_shared_context = false/video_shared_context = true/" $INSTALL/etc/retroarch.cfg
  sed -i -e "s/# menu_show_core_updater = true/# menu_show_core_updater = false/" $INSTALL/etc/retroarch.cfg
  echo 'cursor_directory = "/tmp/database/cursors"' >> $INSTALL/etc/retroarch.cfg
  echo 'recording_output_directory = "/storage/videos"' >> $INSTALL/etc/retroarch.cfg
  echo 'system_directory = "/storage/roms/bios"' >> $INSTALL/etc/retroarch.cfg
  
  # Video
  sed -i -e "s/# video_fullscreen = false/video_fullscreen = true/" $INSTALL/etc/retroarch.cfg
  sed -i -e "s/# video_windowed_fullscreen = true/video_windowed_fullscreen = false/" $INSTALL/etc/retroarch.cfg
  sed -i -e "s/# video_smooth = true/video_smooth = false/" $INSTALL/etc/retroarch.cfg
  sed -i -e "s/# video_aspect_ratio_auto = false/video_aspect_ratio_auto = true/" $INSTALL/etc/retroarch.cfg
  sed -i -e "s/# video_font_size = 48/video_font_size = 32/" $INSTALL/etc/retroarch.cfg
  sed -i -e "s/# video_filter_dir =/video_filter_dir =\/usr\/share\/retroarch\/video_filters/" $INSTALL/etc/retroarch.cfg
  sed -i -e "s/# video_gpu_screenshot = true/video_gpu_screenshot = false/" $INSTALL/etc/retroarch.cfg
  sed -i -e "s/# video_fullscreen = false/video_fullscreen = true/" $INSTALL/etc/retroarch.cfg

  # Audio
  sed -i -e "s/# audio_driver =/audio_driver = \"alsathread\"/" $INSTALL/etc/retroarch.cfg
  sed -i -e "s/# audio_filter_dir =/audio_filter_dir =\/usr\/share\/retroarch\/audio_filters/" $INSTALL/etc/retroarch.cfg
  if [ "$PROJECT" == "OdroidXU3" ]; then # workaround the 55fps bug
    sed -i -e "s/# audio_out_rate = 48000/audio_out_rate = 44100/" $INSTALL/etc/retroarch.cfg
  fi
  
  # Input
  sed -i -e "s/# input_driver = sdl/input_driver = udev/" $INSTALL/etc/retroarch.cfg
  sed -i -e "s/# input_max_users = 16/input_max_users = 5/" $INSTALL/etc/retroarch.cfg
  sed -i -e "s/# input_autodetect_enable = true/input_autodetect_enable = true/" $INSTALL/etc/retroarch.cfg
  sed -i -e "s/# joypad_autoconfig_dir =/joypad_autoconfig_dir = \/tmp\/autoconfig/" $INSTALL/etc/retroarch.cfg
  sed -i -e "s/# input_remapping_directory =/input_remapping_directory = \/storage\/.config\/retroarch\/remappings/" $INSTALL/etc/retroarch.cfg
  sed -i -e "s/# input_menu_toggle_gamepad_combo = 0/input_menu_toggle_gamepad_combo = 2/" $INSTALL/etc/retroarch.cfg

  # Menu
  sed -i -e "s/# menu_mouse_enable = false/menu_mouse_enable = false/" $INSTALL/etc/retroarch.cfg
  sed -i -e "s/# menu_core_enable = true/menu_core_enable = false/" $INSTALL/etc/retroarch.cfg
  sed -i -e "s/# thumbnails_directory =/thumbnails_directory = \/storage\/.config\/retroarch\/thumbnails/" $INSTALL/etc/retroarch.cfg
  echo "menu_show_advanced_settings = \"false\"" >> $INSTALL/etc/retroarch.cfg
  echo "menu_wallpaper_opacity = \"1.0\"" >> $INSTALL/etc/retroarch.cfg
  echo "content_show_images = \"false\"" >> $INSTALL/etc/retroarch.cfg
  echo "content_show_music = \"false\"" >> $INSTALL/etc/retroarch.cfg
  echo "content_show_video = \"false\"" >> $INSTALL/etc/retroarch.cfg

  # Updater
  if [ "$TARGET_ARCH" == "arm" ]; then
    sed -i -e "s/# core_updater_buildbot_url = \"http:\/\/buildbot.libretro.com\"/core_updater_buildbot_url = \"http:\/\/buildbot.libretro.com\/nightly\/linux\/armhf\/latest\/\"/" $INSTALL/etc/retroarch.cfg
  fi

  # Playlists
  echo "playlist_names = \"$RA_PLAYLIST_NAMES\"" >> $INSTALL/etc/retroarch.cfg
  echo "playlist_cores = \"$RA_PLAYLIST_CORES\"" >> $INSTALL/etc/retroarch.cfg
}

post_install() {  
  enable_service tmp-cores.mount
  enable_service tmp-autoconfig.mount
  enable_service tmp-database.mount
  enable_service tmp-assets.mount
  enable_service tmp-shaders.mount
}
