#!/bin/bash

# Source our persisted env variables from container startup
. /etc/transmission/environment-variables.sh
. /etc/sabnzbd/environment-variables.sh

find_sabnzbd_conf()
{
    if [[ -f ${SABNZBD_HOME}/sabnzbd.ini ]]; then
      SABNZBD_CONF=${SABNZBD_HOME}/sabnzbd.ini
    else
     echo "Could not find sabnzbd config file..."
    fi
}

if [[ "${SABNZBD_ENABLED}" = "true" ]]; then
  # Prepare the directories and such
  . /etc/sabnzbd/userSetup.sh
  echo "STARTING SABNZBD"

  find_sabnzbd_conf
  echo "Found config file $SABNZBD_CONF, updating settings."
  service sabnzbdplus start
  echo "sabnzbd startup script complete."

fi
