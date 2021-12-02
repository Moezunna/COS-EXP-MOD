#!/system/bin/sh
# Please don't hardcode /magisk/modname/... ; instead, please use $MODDIR/...
# This will make your scripts compatible even if Magisk change its mount point in the future

#=============================#
# < NICKMOD = COS-EXP-MOD     #
# < VERSION = In the filename #
# < DATE = 29-11-2021         #
#=============================#

MODDIR=${0%/*}

write /proc/sys/vm/page-cluster 0
write /sys/block/zram0/max_comp_streams 16

POST=$MODPATH/post-fs-data

FORCING=$(find /sys/module -name high_perf_mode)

chmod 0777 $POST

busybox echo "1" > $FORCING

setprop mic.volume 7

setenforce <SELINUX_MODE>

# This script will be executed in post-fs-data mode
# More info in the main Magisk thread

#THERM
echo 0 > /sys/module/lowmemorykiller/parameters/debug_level

echo '0:0' > /sys/module/msm_performance/parameters/cpu_min_freq
echo '1:0' > /sys/module/msm_performance/parameters/cpu_min_freq
echo '2:0' > /sys/module/msm_performance/parameters/cpu_min_freq
echo '3:0' > /sys/module/msm_performance/parameters/cpu_min_freq
chmod 644 /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq
echo '0' > /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq
chmod 444 /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq
chmod 644 /sys/devices/system/cpu/cpu1/cpufreq/scaling_min_freq
echo '0' > /sys/devices/system/cpu/cpu1/cpufreq/scaling_min_freq
chmod 444 /sys/devices/system/cpu/cpu1/cpufreq/scaling_min_freq
chmod 644 /sys/devices/system/cpu/cpu2/cpufreq/scaling_min_freq
echo '0' > /sys/devices/system/cpu/cpu2/cpufreq/scaling_min_freq
chmod 444 /sys/devices/system/cpu/cpu2/cpufreq/scaling_min_freq
chmod 644 /sys/devices/system/cpu/cpu3/cpufreq/scaling_min_freq
echo '0' > /sys/devices/system/cpu/cpu3/cpufreq/scaling_min_freq
chmod 444 /sys/devices/system/cpu/cpu3/cpufreq/scaling_min_freq

exit 0

