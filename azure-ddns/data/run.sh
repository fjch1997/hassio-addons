#!/usr/bin/env bashio
set -e

while :
do
    ha network info
    /Azure-DynDns --interface-name eth0 --dry-run --hassio
    sleep 300
done
