#!/bin/sh
#
# thomas@linuxmuster.net
# 20180309
#
# invoke a shell command in linuxmuster-nginx-proxy container
#

/usr/bin/docker exec -it linuxmuster-nginx-proxy $@
