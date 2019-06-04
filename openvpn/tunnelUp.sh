#!/bin/bash

/etc/transmission/start.sh "$@"
[[ ! -f /opt/tinyproxy/start.sh ]] || /opt/tinyproxy/start.sh
[[ ! -f /etc/sabnzbd/start.sh ]] || /etc/sabnzbd/start.sh
