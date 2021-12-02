#=============================#
# < NICKMOD = COS-EXP-MOD     #
# < VERSION = In the filename #
# < DATE = 29-11-2021         #
#=============================#

# !/sbin/sh

busybox mount /sys

# Backup Original Battery Tweak

if [ ! -f /proc/sys/net/core/default_qdisc.partc ]; then
  cp /proc/sys/net/core/default_qdisc /proc/sys/net/core/default_qdisc.partc
fi

if [ ! -f /proc/sys/net/ipv4/tcp_congestion_control.partc ]; then
  cp /proc/sys/net/ipv4/tcp_congestion_control /proc/sys/net/ipv4/tcp_congestion_control.partc
fi

