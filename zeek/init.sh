mv /usr/local/zeek/share/zeek/site/local.zeek.bak /usr/local/zeek/share/zeek/site/local.zeek 2>/dev/null
cp -n /usr/local/zeek/share/zeek/site/local.zeek{,.bak}
echo "@load policy/tuning/json-logs.zeek" >> /usr/local/zeek/share/zeek/site/local.zeek

mv /usr/local/zeek/etc/node.cfg.bak /usr/local/zeek/etc/node.cfg 2>/dev/null
cp -n /usr/local/zeek/etc/node.cfg{,.bak}
sed -i "s/^interface\=eth0/interface=$IFNAME/g" /usr/local/zeek/etc/node.cfg

zeekctl deploy
sleep infinity
# tail -f /usr/local/zeek/spool/zeek/*.log