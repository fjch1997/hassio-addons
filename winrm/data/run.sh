#!/usr/bin/env bashio
set -e

# Read from STDIN aliases to send shutdown
while read -r input; do
    # parse JSON value
    input=$(bashio::jq "${input}" '.')

    ./run.py $input || true
done