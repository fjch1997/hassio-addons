#!/usr/bin/with-contenv bashio
set -e

export DOTNET_SYSTEM_GLOBALIZATION_INVARIANT=1
CONFIG_PATH=/data/options.json

while :
do
    if [ "$(bashio::config 'dryRun')" = true ] ; then
        DryRun="--dyr-run"
    else
        DryRun=""
    fi

    /root/.dotnet/dotnet /Azure-DynDns.dll \
    --tenant-id "$(bashio::config 'tenantId')" \
    --subscription-id "$(bashio::config 'subscriptionId')" \
    --resource-group "$(bashio::config 'resourceGroup')" \
    --zone "$(bashio::config 'zone')" \
    --record "$(bashio::config 'record')" \
    --client-id "$(bashio::config 'clientId')" \
    --client-secret "$(bashio::config 'clientSecret')" \
    --interface-name "$(bashio::config 'interfaceName')" \
    --interface-address-family $(bashio::config 'interfaceAddressFamily') \
    --ttl $(bashio::config 'ttl') \
    $DryRun
    sleep 300
done
