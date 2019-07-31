#!/bin/bash

/etc/transmission/stop.sh
[[ ! -f /opt/tinyproxy/stop.sh ]] || /opt/tinyproxy/stop.sh
[[ ! -f /etc/sabnzbd/stop.sh ]] || /etc/sabnzbd/stop.sh
