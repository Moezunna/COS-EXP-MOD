MODDIR=${0%/*}
#=============================#
# < NICKMOD = COS-EXP-MOD     #
# < VERSION = In the filename #
# < DATE = 12-02-2022         #
#=============================#

write /proc/sys/vm/page-cluster 0
write /sys/block/zram0/max_comp_streams 16

setenforce <SELINUX_MODE>

zram(){
swapoff /dev/block/zram0 /dev/null 2>&1
echo 1 > /sys/block/zram0/reset
echo $zramsize > /sys/block/zram0/disksize
mkswap /dev/block/zram0 /dev/null 2>&1
swapon /dev/block/zram0 /dev/null 2>&1
}

