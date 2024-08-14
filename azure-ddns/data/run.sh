#!/usr/bin/with-contenv bashio
set -e

export DOTNET_SYSTEM_GLOBALIZATION_INVARIANT=1
CONFIG_PATH=/data/options.json

if [ "$(bashio::config 'dryRun')" = true ] ; then
    DryRun="--dry-run"
else
    DryRun=""
fi

InterfaceName=""
for i in $(bashio::config "interfaceName"); do
    if [[ -z "$InterfaceName" ]]; then
        InterfaceName="--interface-name"
    fi
    InterfaceName="$InterfaceName \""$i"\""
done

InterfaceAddressFamily=""
for i in $(bashio::config "interfaceAddressFamily"); do
    if [[ -z "$InterfaceAddressFamily" ]]; then
        InterfaceAddressFamily="--interface-address-family"
    fi
    InterfaceAddressFamily="$InterfaceAddressFamily $(echo $i | xargs)"
done

while :
do
    echo /root/.dotnet/dotnet /Azure-DynDns.dll \
    --tenant-id \""$(bashio::config 'tenantId')"\" \
    --subscription-id \""$(bashio::config 'subscriptionId')"\" \
    --resource-group \""$(bashio::config 'resourceGroup')"\" \
    --zone \""$(bashio::config 'zone')"\" \
    --record \""$(bashio::config 'record')"\" \
    --client-id \""$(bashio::config 'clientId')"\" \
    --client-secret \""$(bashio::config 'clientSecret')"\" \
    $InterfaceName \
    $InterfaceAddressFamily \
    --ttl "$(bashio::config 'ttl')" \
    $DryRun || true
    /root/.dotnet/dotnet /Azure-DynDns.dll \
    --tenant-id \""$(bashio::config 'tenantId')"\" \
    --subscription-id \""$(bashio::config 'subscriptionId')"\" \
    --resource-group \""$(bashio::config 'resourceGroup')"\" \
    --zone \""$(bashio::config 'zone')"\" \
    --record \""$(bashio::config 'record')"\" \
    --client-id \""$(bashio::config 'clientId')"\" \
    --client-secret \""$(bashio::config 'clientSecret')"\" \
    $InterfaceName \
    $InterfaceAddressFamily \
    --ttl "$(bashio::config 'ttl')" \
    $DryRun || true
    sleep 300
done
