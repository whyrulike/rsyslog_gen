#!/bin/bash

bin_name="osmosisd"

priority_level="99"

log_path="/var/log/$bin_name/$bin_name.log"

conf_path="/etc/rsyslog.d/$priority_level-$bin_name.conf"

sudo tee "$conf_path" > /dev/null <<EOF
if \$programname == '$bin_name' then $log_path
& stop
EOF

sudo systemctl restart rsyslog

echo $log_path
