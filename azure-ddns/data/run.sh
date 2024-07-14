#!/usr/bin/env bashio
set -e

export DOTNET_SYSTEM_GLOBALIZATION_INVARIANT=1
while :
do
    /root/.dotnet/dotnet /Azure-DynDns.dll --interface-name eth0 --dry-run
    sleep 300
done
