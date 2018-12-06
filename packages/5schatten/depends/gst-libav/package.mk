# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="gst-libav"
PKG_VERSION="1.14.4"
PKG_SHA256="7c1749e4c43082607ee3d4e80b4efd2f29ebc03667491d237840d5a693e4718f"
PKG_LICENSE="GPL"
PKG_SITE="https://gstreamer.freedesktop.org/modules/gst-libav.html"
PKG_URL="https://github.com/GStreamer/gst-libav/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain gstreamer ffmpeg"
PKG_LONGDESC="GStreamer plugin for the libav* library (former FFmpeg)"

makeinstall_target(){
  # Install lib
  mkdir -p $INSTALL/usr/lib
  cp -PR ext/libav/libgstlibav.so $INSTALL/usr/lib
}
