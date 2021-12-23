# !/system/bin/sh
# Please don't hardcode /magisk/modname/... ; instead, please use $MODDIR/...
# This will make your scripts compatible even if Magisk change its mount point in the future

#=============================#
# < NICKMOD = COS-EXP-MOD     #
# < VERSION = In the filename #
# < DATE = 29-11-2021         #
#=============================#

MODDIR=${0%/*}

#----------------
#improve
ext() 
{
    if [ -f ${2} ]; then
        chmod 0666 ${2}
        echo ${1} > ${2}
        chmod 0444 ${2}
    fi
}
#----------------

#----------------
#Zram
sleep 15
echo 4096M >/sys/block/zram0/disksize
mkswap /dev/block/zram0
swapon /dev/block/zram0

sleep 15
echo 1024M >/sys/block/zram1/disksize
mkswap /dev/block/zram1
swapon /dev/block/zram1

sleep 15
echo 1024M >/sys/block/zram2/disksize
mkswap /dev/block/zram2
swapon /dev/block/zram2
#----------------

#----------------
#THERM
setenforce 0

chmod 755 /sys/class/power_supply/battery/constant_charge_current_max
echo 6000000 > /sys/class/power_supply/battery/constant_charge_current_max
chmod 755 /sys/class/power_supply/battery/input_current_max
echo 6000000 > /sys/class/power_supply/battery/input_current_max
chmod 555 /sys/class/power_supply/battery/constant_charge_current_max
chmod 555 /sys/class/power_supply/battery/input_current_max

echo 0 > /sys/module/subsystem_restart/parameters/enable_ramdumps
echo 0 > /sys/module/subsystem_restart/parameters/enable_mini_ramdumps

echo 0 > /sys/block/sda/queue/iostats

echo 0 > /proc/sys/kernel/sched_boost

echo Y > /sys/module/lpm_levels/parameters/sleep_disabled

echo 3 > /proc/sys/vm/drop_caches

echo 'N' > /sys/module/sync/parameters/fsync_enabled

/system/bin/KFmark
/system/bin/LMK

exit 0
#----------------
