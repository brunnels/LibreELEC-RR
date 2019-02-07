# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present Team LibreELEC (https://libreelec.tv)

from contextlib import closing
import json
import socket
import xbmc
import xbmcaddon
import xbmcgui


def rpc(method, params={}):
    request = json.dumps({'id':
                          1,
                          'jsonrpc':
                              '2.0',
                          'method':
                              method,
                          'params':
                              params,
                          })
    response = ''
    with closing(socket.socket(socket.AF_INET, socket.SOCK_STREAM)) as s:
        s.connect(('127.0.0.1', int(xbmcaddon.Addon().getSetting('ss_cp'))))
        s.send(request + '\r\n')
        response = s.recv(10240)
    return json.loads(response)


streams = ['AirPlay', 'Default', 'Kodi', 'Librespot']
streamx = xbmcgui.Dialog().select(
    xbmcaddon.Addon().getLocalizedString(30020), streams)
if streamx != -1:
    stream = streams[streamx]
    for group in rpc('Server.GetStatus')['result']['server']['groups']:
        rpc('Group.SetStream', {'id': group['id'], 'stream_id': stream})
