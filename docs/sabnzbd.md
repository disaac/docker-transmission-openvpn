# Running Blackvpn docker-compose-blvpn-sdunixgeek

To use the blackvpn for sdunixgeek do the following:

* Do the following in the project directory in your shell:

```bash
export BVPN_OPENVPN_USERNAME=<blackvpn_password>
export BVPN_OPENVPN_PASSWORD=<blackvpn_password>
# Torrent download directory location
export BLVPN_TORRENT_DL_DIR=${HOME}/Documents/TorrentDownloads
# timezone file
mkdir -p ${HOME}/etc
echo 'America/Los_Angeles' > ${HOME}/etc/timezone
chmod a+r ${HOME}/etc/timezone
chmod a+rx ${HOME}/etc
export BLVPN_TZONE_FILE=${HOME}/etc/timezone
# Run the docker container with the custom docker-compose file
docker-compose -f docker-compose-blvpn-sdunixgeek.yml up -d
```
