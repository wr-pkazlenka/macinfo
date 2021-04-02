# MACINFO
This script names your NIC manufacturer based on MAC-address

## Usage

./macinfo.sh <mac address>
    <mac address> must be in format xx:xx:xx:xx:xx:xx or xx-xx-xx-xx-xx-xx
    $API_KEY env variable must contain api key for macaddress.io

## Usage inside docker container
$ docker build -t macinfo .
docker run -e API_KEY=<your macaddress.io api key> macinfo <MAC address>