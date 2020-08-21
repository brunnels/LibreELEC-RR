# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2018-present Frank Hartung (supervisedthinking@gmail.com)

PKG_NAME="gtk2"
PKG_VERSION="2.24.32"
PKG_SHA256="b6c8a93ddda5eabe3bfee1eb39636c9a03d2a56c7b62828b359bf197943c582e"
PKG_LICENSE="OSS"
PKG_SITE="http://www.gtk.org/"
PKG_URL="http://ftp.gnome.org/pub/gnome/sources/gtk+/${PKG_VERSION:0:4}/gtk+-$PKG_VERSION.tar.xz"
PKG_DEPENDS_TARGET="toolchain atk libX11 libXrandr libXi glib pango cairo gdk-pixbuf"
PKG_LONGDESC="gtk+: The Gimp ToolKit (GTK)"
PKG_TOOLCHAIN="autotools"

PKG_CONFIGURE_OPTS_TARGET="ac_cv_path_GLIB_GENMARSHAL=$TOOLCHAIN/bin/glib-genmarshal \
                           --disable-glibtest \
                           --enable-modules \
                           --enable-explicit-deps=no \
                           --disable-debug \
                           --enable-shm \
                           --disable-cups \
                           --disable-papi \
                           --enable-xkb \
                           --disable-xinerama \
                           --disable-gtk-doc-html \
                           --with-xinput"

pre_configure_target() {
  LIBS="$LIBS -lXcursor"
  export PKG_CONFIG_PATH="$(get_build_dir pango)/.$TARGET_NAME/meson-private:$(get_build_dir gdk-pixbuf)/.$TARGET_NAME/meson-private:$(get_build_dir shared-mime-info)/.$TARGET_NAME"
  export CFLAGS="$CFLAGS -I$(get_build_dir pango) -I$(get_build_dir pango)/.$TARGET_NAME -L$(get_build_dir pango)/.$TARGET_NAME/pango"
  export GLIB_COMPILE_RESOURCES=glib-compile-resources GLIB_MKENUMS=glib-mkenums GLIB_GENMARSHAL=glib-genmarshal
}

make_target() {
  make SRC_SUBDIRS="gdk gtk modules"
  make install DESTDIR=$SYSROOT_PREFIX $PKG_MAKEINSTALL_OPTS_TARGET SRC_SUBDIRS="gdk gtk modules"
}

makeinstall_target() {
  make install DESTDIR=$INSTALL SRC_SUBDIRS="gdk gtk modules"
}
