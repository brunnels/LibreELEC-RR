# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)
# Copyright (C) 2018-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="glfw"
PKG_VERSION="3.2.1"
PKG_SHA256="e10f0de1384d75e6fc210c53e91843f6110d6c4f3afbfb588130713c2f9d8fe8"
PKG_ARCH="x86_64"
PKG_LICENSE="BSD"
PKG_SITE="http://glfw.org"
PKG_URL="https://github.com/glfw/glfw/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain mesa glu"
PKG_LONGDESC="provides a simple API for creating windows, contexts and surfaces, receiving input and events"

if [ "$OPENGL" = "no" ] ; then
  exit 0
fi

PKG_CMAKE_OPTS_TARGET="-DGLFW_BUILD_EXAMPLES=off \
                       -DGLFW_BUILD_TESTS=off \
                       -DGLFW_BUILD_DOCS=off"
