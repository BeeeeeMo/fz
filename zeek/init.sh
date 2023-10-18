#!/bin/bash

set -euxo pipefail

mv /usr/local/zeek/share/zeek/site/local.zeek.bak /usr/local/zeek/share/zeek/site/local.zeek 2>/dev/null || true
cp -n /usr/local/zeek/share/zeek/site/local.zeek{,.bak}

if [ -e /zeek/local.zeek ]
then
    cp /zeek/local.zeek /usr/local/zeek/share/zeek/site/local.zeek
    echo "Copy local.zeek to  /usr/local/zeek/share/zeek/site/local.zeek"
else
    echo "No custom local.zeek found"
fi

mv /usr/local/zeek/etc/node.cfg.bak /usr/local/zeek/etc/node.cfg 2>/dev/null || true
cp -n /usr/local/zeek/etc/node.cfg{,.bak}
set +eu
sed -i "s/^interface\=eth0/interface=$IFNAME/g" /usr/local/zeek/etc/node.cfg
set -eu

zeekctl deploy
sleep infinity
