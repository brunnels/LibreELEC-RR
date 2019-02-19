# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2019-present Team LibreELEC (https://libreelec.tv)

import json
import subprocess
import xbmc
import xbmcaddon
import xbmcgui


class Monitor(xbmc.Monitor):

    def __init__(self, *args, **kwargs):
        xbmc.Monitor.__init__(self)
        self.id = xbmcaddon.Addon().getAddonInfo('id')

    def onSettingsChanged(self):
        subprocess.call(['systemctl', 'restart', self.id])

subprocess.call("systemd-run /bin/sh /usr/share/kodi/addons/service.rr-config-tool/bin/rr-config-tool.start", shell=True)
