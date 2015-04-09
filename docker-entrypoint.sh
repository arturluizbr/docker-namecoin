#!/bin/bash
set -e

if [ "$1" = 'namecoin' ]; then
    exec namecoind -datadir=/data -conf=/root/.namecoin/namecoin.conf `echo ${@:2}`
else
    exec "$@"
fi
