TERMUX_PKG_HOMEPAGE=https://fcitx-im.org/
TERMUX_PKG_DESCRIPTION="Fcitx Qt immodule & library"
TERMUX_PKG_LICENSE="LGPL-2.1"
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_VERSION="5.1.9"
TERMUX_PKG_SRCURL=https://github.com/fcitx/fcitx5-qt/archive/refs/tags/${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_SHA256=4e691182f20984d11f8ea391a57b2711e362c43fda21236327e386c07f9c8998
TERMUX_PKG_AUTO_UPDATE=true
TERMUX_PKG_UPDATE_TAG_TYPE="newest-tag"
TERMUX_PKG_DEPENDS="fcitx5, libc++, libx11, libxcb, libxkbcommon, qt6-qtbase"
TERMUX_PKG_EXTRA_CONFIGURE_ARGS="
-DENABLE_TEST=OFF
-DENABLE_QT4=OFF
-DENABLE_QT5=OFF
-DENABLE_QT6=ON
-DENABLE_QT6_WAYLAND_WORKAROUND=OFF
"

termux_step_post_make_install() {
	local _QT6_PLATFORM_INPUT_CONTEXTS_DIR=$TERMUX_PREFIX/lib/qt6/plugins/platforminputcontexts
	mkdir -p "$_QT6_PLATFORM_INPUT_CONTEXTS_DIR"
	mv $TERMUX_PREFIX/opt/qt6/cross/lib/qt6/plugins/platforminputcontexts/libfcitx5platforminputcontextplugin.so $_QT6_PLATFORM_INPUT_CONTEXTS_DIR
}
