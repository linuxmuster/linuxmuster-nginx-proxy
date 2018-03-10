#!/bin/sh
#
# thomas@linuxmuster.net
# 20180309
#
# stop linuxmuster-nginx-proxy container
#

name="linuxmuster-nginx-proxy"

# shutdown container
echo "Shutting down container:"
/usr/bin/docker stop "$name" || exit 1

# remove container
echo "Removing container:"
/usr/bin/docker rm "$name" || exit 1
