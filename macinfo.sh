#!/usr/bin/env bash
# I use bash as the one is default on linux distros mentioned in task


# These are standard helper functions
function print_usage() {
    echo "Usage: $0 <mac address>
    <mac address> must be in format xx:xx:xx:xx:xx:xx or xx-xx-xx-xx-xx-xx
    \$API_KEY env variable must contain api key for macaddress.io"
}
function die() {
    echo $1
    print_usage
    exit $2
}

# Verify that macaddress.io key is in environment variable
# I used environment variable as the primitive security measure to not store any keys in repository.
# Of course, it's better to use something like docker secrets (https://docs.docker.com/engine/swarm/secrets/), but I'm not really good in it
[[ -v API_KEY ]] || die "\$API_KEY is not set. You need to export macaddress.io api key into this variable" 255

# Verify that mac address provided looks like mac address
MAC=$(echo $1|tr '-' ':')
[[ $MAC =~ ^([0-9A-Fa-f]{2}\:){5}[0-9A-Fa-f]{2}$ ]] || die "Your mac address doesn't look like mac address" 254

# Simple curl call
echo $(curl -s "https://api.macaddress.io/v1?apiKey=$API_KEY&output=vendor&search=${MAC}")

exit 0
