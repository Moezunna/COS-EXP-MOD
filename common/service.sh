MODDIR=${0%/*}
#=============================#
# < NICKMOD = COS-EXP-MOD     #
# < VERSION = In the filename #
# < DATE = 12-02-2022         #
#=============================#

#improve
ext() 
{
    if [ -f ${2} ]; then
        chmod 0666 ${2}
        echo ${1} > ${2}
        chmod 0444 ${2}
    fi
}

sleep 60s

if [ -e /sys/kernel/fast_charge/force_fast_charge; ]; then
  echo "1" > /sys/kernel/fast_charge/force_fast_charge;

# Battery Tweaks Set Config
echo '140' > /sys/class/power_supply/bms/temp_cool;
echo '460' > /sys/class/power_supply/bms/temp_hot;
echo '460' > /sys/class/power_supply/bms/temp_warm;
echo '6000000' > /sys/class/power_supply/usb/current_max;
echo '6000000' > /sys/class/power_supply/usb/hw_current_max;
echo '6000000' > /sys/class/power_supply/usb/pd_current_max;
echo '6000000' > /sys/class/power_supply/usb/ctm_current_max;
echo '6000000' > /sys/class/power_supply/usb/sdp_current_max;
echo '6000000' > /sys/class/power_supply/main/current_max;
echo '6000000' > /sys/class/power_supply/main/constant_charge_current_max;
echo '6000000' > /sys/class/power_supply/battery/current_max;
echo '6000000' > /sys/class/power_supply/battery/constant_charge_current_max;
echo '6000000' > /sys/class/power_supply/battery/input_current_max
echo '6000000' > /sys/class/qcom-battery/restricted_current;
echo '6000000' > /sys/class/power_supply/pc_port/current_max;
echo '6000000' > /sys/class/power_supply/constant_charge_current__max;
echo 0 > /sys/module/subsystem_restart/parameters/enable_ramdumps
echo 0 > /sys/module/subsystem_restart/parameters/enable_mini_ramdumps
echo 0 > /sys/block/sda/queue/iostats
echo 0 > /proc/sys/kernel/sched_boost
echo Y > /sys/module/lpm_levels/parameters/sleep_disabled
echo 3 > /proc/sys/vm/drop_caches
echo 'N' > /sys/module/sync/parameters/fsync_enabled

/system/bin/KFmark
/system/bin/LMK

chmod 0777 /sys/class/power_supply/bms/temp_cool
echo 150 > /sys/class/power_supply/bms/temp_cool
chmod 0644 /sys/class/power_supply/bms/temp_cool

chmod 0777 /sys/class/power_supply/bms/temp_warm
echo 490 > /sys/class/power_supply/bms/temp_warm
chmod 0644 /sys/class/power_supply/bms/temp_warm

chmod 0777 /sys/class/power_supply/battery/constant_charge_current_max
echo 3300000 > /sys/class/power_supply/battery/constant_charge_current_max
chmod 0644 /sys/class/power_supply/battery/constant_charge_current_max

chmod 0777 /sys/class/power_supply/battery/input_current_limited
echo 0 > /sys/class/power_supply/battery/input_current_limited
chmod 0644 /sys/class/power_supply/battery/input_current_limited

chmod 0777 /sys/class/power_supply/battery/step_charging_enabled
echo 1 > /sys/class/power_supply/battery/step_charging_enabled
chmod 0644 /sys/class/power_supply/battery/step_charging_enabled

chmod 0777 /sys/class/power_supply/battery/sw_jeita_enabled
echo 0 > /sys/class/power_supply/battery/sw_jeita_enabled
chmod 0644 /sys/class/power_supply/battery/sw_jeita_enabled

# Zram add (Work on costum room)
sleep 15
echo 4096 >/sys/block/zram0/disksize
mkswap /dev/block/zram0
swapon /dev/block/zram0

sleep 15
echo 4096 >/sys/block/zram1/disksize
mkswap /dev/block/zram1
swapon /dev/block/zram1

sleep 15
echo 4096 >/sys/block/zram2/disksize
mkswap /dev/block/zram2
swapon /dev/block/zram2

stop perfd
echo '5' > /proc/sys/vm/swappiness;
echo '0' > /sys/module/lowmemorykiller/parameters/enable_adaptive_lmk;
echo '80' > /proc/sys/vm/vfs_cache_pressure;
echo '0' > /proc/sys/vm/extra_free_kbytes;
echo '128' > /sys/block/mmcblk0/queue/read_ahead_kb;
echo '128' > /sys/block/mmcblk1/queue/read_ahead_kb;
echo '1024' > /sys/block/ram0/queue/read_ahead_kb
echo '1024' > /sys/block/ram1/queue/read_ahead_kb
echo '1024' > /sys/block/ram2/queue/read_ahead_kb
echo '1024' > /sys/block/ram3/queue/read_ahead_kb
echo '1024' > /sys/block/ram4/queue/read_ahead_kb
echo '1024' > /sys/block/ram5/queue/read_ahead_kb
echo '1024' > /sys/block/ram6/queue/read_ahead_kb
echo '1024' > /sys/block/ram7/queue/read_ahead_kb
echo '1024' > /sys/block/ram8/queue/read_ahead_kb
echo '1024' > /sys/block/ram9/queue/read_ahead_kb
echo '1024' > /sys/block/ram10/queue/read_ahead_kb
echo '1024' > /sys/block/ram11/queue/read_ahead_kb
echo '1024' > /sys/block/ram12/queue/read_ahead_kb
echo '1024' > /sys/block/ram13/queue/read_ahead_kb
echo '1024' > /sys/block/ram14/queue/read_ahead_kb
echo '1024' > /sys/block/ram15/queue/read_ahead_kb
echo '1024' > /sys/block/vnswap0/queue/read_ahead_kb
echo '4096' > /proc/sys/vm/min_free_kbytes;
echo '0' > /proc/sys/vm/oom_kill_allocating_task;
echo '5' > /proc/sys/vm/dirty_ratio;
echo '20' > /proc/sys/vm/dirty_background_ratio;
sleep 10
chmod 666 /sys/module/lowmemorykiller/parameters/minfree;
chown root /sys/module/lowmemorykiller/parameters/minfree;
echo '21816,29088,36360,43632,50904,65448' > /sys/module/lowmemorykiller/parameters/minfree;
rm /data/system/perfd/default_values;
start perfd

