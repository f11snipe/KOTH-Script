#!/bin/bash
#H3X-007 :)

ip_file="/etc/HOST"
nick_file="/etc/nick"

if [ -f "$ip_file" ]; then
    ip_address=$(head -n 1 "$ip_file")
fi

if [ -f "$nick_file" ]; then
    nick=$(head -n 1 "$nick_file")
fi

while true; do
    current_nick=$(sudo cat /root/king.txt)
    if [ "$current_nick" != "$nick" ]; then
        echo "$nick" >> /root/king.txt
        sudo tee /root/king.txt >/dev/null <<< "$nick"
    fi
    sleep 0.5
done >/dev/null 2>&1 &
