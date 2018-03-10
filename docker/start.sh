#!/bin/sh
#
# thomas@linuxmuster.net
# 20180309
#
# start linuxmuster-nginx-proxy container
#

name="linuxmuster-nginx-proxy"
template="/usr/share/$name/docker-compose.yml"

cd "/srv/docker/$name"

# get ports from configs
ports="$(grep -hi listen conf.d/*.conf | awk '{ print $2 }' | awk -F\; '{ print $1 }')"
line="ports:\\n"
for i in $ports; do
  line="$line     - \"$i:$i\"\\n"
done

# update docker-compose.yml
sed -e "s|@@ports@@|$line|" "$template" > "$(basename "$template")"

# fire up container
echo "Starting container:"
/usr/bin/docker-compose up -d "$name" || exit 1
