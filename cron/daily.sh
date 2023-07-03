#/bin/bash

# Daily remove cron.log
echo > /var/log/cron.log

# Daily remove zeek logs
find /opt/zeek/logs -depth -type d ! -name '.' -prune -mtime +$remove_days -exec rm -rf {} \;
echo "[*] remove logs"> /var/log/cron.log