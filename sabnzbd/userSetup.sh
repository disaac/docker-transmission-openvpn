#!/bin/sh

# More/less taken from https://github.com/linuxserver/docker-baseimage-alpine/blob/3eb7146a55b7bff547905e0d3f71a26036448ae6/root/etc/cont-init.d/10-adduser

RUN_AS=root

if [ -n "$PUID" ] && [ ! "$(id -u root)" -eq "$PUID" ]; then
    RUN_AS=abc
    if [ ! "$(id -u ${RUN_AS})" -eq "$PUID" ]; then usermod -o -u "$PUID" ${RUN_AS} ; fi
    if [ ! "$(id -g ${RUN_AS})" -eq "$PGID" ]; then groupmod -o -g "$PGID" ${RUN_AS} ; fi

    # Make sure directories exist before chown and chmod
    mkdir -p /config \
        ${SABNZBD_HOME} \
        ${SABNZBD_DOWNLOAD_DIR} \
        ${SABNZBD_INCOMPLETE_DIR} \
        ${SABNZBD_WATCH_DIR} \
        ${SABNZBD_NZB_BAK} \
        ${SABNZBD_NZB_SCRIPTS}


    echo "Enforcing ownership on sabnzbd config directories"
    chown -R ${RUN_AS}:${RUN_AS} \
        /config \
        ${SABNZBD_HOME}

    echo "Applying permissions to sabnzbd config directories"
    chmod -R go=rX,u=rwX \
        /config \
        ${SABNZBD_HOME}

    if [ "$GLOBAL_APPLY_PERMISSIONS" = true ] ; then
	echo "Setting owner for sabnzbd paths to ${PUID}:${PGID}"
        chown -R ${RUN_AS}:${RUN_AS} \
            ${SABNZBD_DOWNLOAD_DIR} \
            ${SABNZBD_INCOMPLETE_DIR} \
            ${SABNZBD_WATCH_DIR} \
            ${SABNZBD_NZB_BAK} \
            ${SABNZBD_NZB_SCRIPTS}

	echo "Setting permission for files (644) and directories (755)"
        chmod -R go=rX,u=rwX \
            ${SABNZBD_DOWNLOAD_DIR} \
            ${SABNZBD_INCOMPLETE_DIR} \
            ${SABNZBD_WATCH_DIR} \
            ${SABNZBD_NZB_BAK} \
            ${SABNZBD_NZB_SCRIPTS}
    fi
fi

echo "
-------------------------------------
sabnzbd will run as
-------------------------------------
User name:   ${RUN_AS}
User uid:    $(id -u ${RUN_AS})
User gid:    $(id -g ${RUN_AS})
-------------------------------------
"

export PUID
export PGID
export RUN_AS
