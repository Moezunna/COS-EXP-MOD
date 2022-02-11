##########################################################################################
#
# Magisk
# by topjohnwu
# 
# This is a template zip for developers
#
##########################################################################################
##########################################################################################
# 
# Instructions:
# 
# 1. Place your files into system folder (delete the placeholder file)
# 2. Fill in your module's info into module.prop
# 3. Configure the settings in this file (common/config.sh)
# 4. For advanced features, add shell commands into the script files under common:
#    post-fs-data.sh, service.sh
# 5. For changing props, add your additional/modified props into common/system.prop
# 
##########################################################################################

##########################################################################################
# Defines
##########################################################################################

# NOTE: This part has to be adjusted to fit your own needs

# This will be the folder name under /magisk
# This should also be the same as the id in your module.prop to prevent confusion
MODID=RED8

# Set to true if you need to enable Magic Mount
# Most mods would like it to be enabled
AUTOMOUNT=true

# Set to true if you need to load system.prop
PROPFILE=true

# Set to true if you need post-fs-data script
POSTFSDATA=true

# Set to true if you need late_start service script
LATESTARTSERVICE=true

##########################################################################################
# Installation Message
##########################################################################################

# Set what you want to show when installing your mod

print_modname() {
  ui_print "۩▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬ஜ۩۞۩ஜ▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬۩"
  sleep 0
  ui_print "========================================="
  ui_print "          COSTUM MODULE BY MOEZU         ="
  ui_print " !!Approximately install only 1 minute!! ="
  ui_print "========================================="
  #Loading
  ui_print "Loading..."
  ui_print " "
  ui_print "*************************************"
  ui_print " ID=$MODID                           "
  ui_print " name=$MODNAME                       "
  ui_print " MagiskVersion=$MAGISK_VER           "
  ui_print " MagiskVersionCode=$MAGISK_VER_CODE  "
  ui_print " Module_Verison=v0.0.1               "
  ui_print "*************************************"
  ui_print " "
  sleep 5
  ui_print " Starting Instal "
  #Start
  sleep 1
  ui_print " Light Tweak "
  sleep 3
  ui_print "************************"
  ui_print "* Tweak Costum By MoeZu *"
  ui_print "* -Audio    Set         *"
  ui_print "* -Boot     set  60fps  *"
  ui_print "* -Camera   Set         *"
  ui_print "* -Cpu      Set control *"
  ui_print "* -Dalvik   Set         *"
  ui_print "* -Device   not         *"
  ui_print "* -Display  not         *"
  ui_print "* -Internet not         *"
  ui_print "* -Miui     Set feature *"
  ui_print "* -Picture  set         *"
  ui_print "* -Sound    Set   best  *"
  ui_print "* -Touch    not         *"
  ui_print "************************"
  sleep 1
  ui_print " Zram Upping D0 4GB + D1 1GB + D2 1GB "
  ui_print " Zram work on costum rom"
  sleep 3
  ui_print "************************"
  ui_print "* -Zram Costum By MoeZu *"
  ui_print "*    -Zram0             *"
  ui_print "*    -Zram1 not work    *"
  ui_print "*    -Zram2 not work    *"
  ui_print "************************"
  sleep 1
  ui_print " Light Therm Set Costum "
  sleep 3
  ui_print " Set thermal mod for redmi 8 Olive "
  sleep 1
  ui_print " Open Gl 5.0 "
  sleep 3
  ui_print " -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-"
  ui_print "[   / __ \/ __ \/ ____/ | / /  / ____/ /  ]"
  ui_print "[  / / / / /_/ / __/ /  |/ /  / / __/ /   ]"
  ui_print "[ / /_/ / ____/ /___/ /|  /  / /_/ / /___ ]"
  ui_print "[ \____/_/   /_____/_/_|_/   \____/_____/ ]"
  ui_print " -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-"
  sleep 0
  #End
  ui_print "۩▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬ஜ۩۞۩ஜ▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬۩"
  sleep 3
echo " "
echo "After Install Check Your Audio"
echo "After Install Check Your Opengl"
echo "After Install Check Your Sensor"
echo "After Install Check Your Zram"
echo " "
  ui_print "- Extracting module files"
  unzip -o "$ZIPFILE" 'system/*' -d $MODPATH >&2
  sleep 3
  rm -rf /data/resource-cache/*
  rm -rf /data/system/package_cache/*
  rm -rf /cache/*
  rm -rf /data/dalvik-cache/*
  ui_print "- Deleting package cache files"
  ui_print "- Enabling DT2S"
  su -c  cmd settings put system deviceLevelList v:3,c:3,g:3
  ui_print "- Enable blur"
  ui_print "Done!"
sleep 5
echo "Installation Completed"
echo " "
sleep 3
ui_print "Reboot For Perfect Completed!!"
}

##########################################################################################
# Replace list
##########################################################################################

# List all directories you want to directly replace in the system
# By default Magisk will merge your files with the original system
# Directories listed here however, will be directly mounted to the correspond directory in the system

# You don't need to remove the example below, these values will be overwritten by your own list
# This is an example
REPLACE="
/system/app/Youtube
/system/priv-app/SystemUI
/system/priv-app/Settings
/system/framework
"

# Construct your own list here, it will overwrite the example
# !DO NOT! remove this if you don't need to replace anything, leave it empty as it is now
REPLACE="
/system/vendor/etc/gps.conf
/system/vendor/etc/thermal-engine-camera.conf
/system/vendor/etc/thermal-engine-high.conf
/system/vendor/etc/thermal-engine-map.conf
/system/vendor/etc/thermal-engine-nolimits.conf
/system/vendor/etc/thermal-engine-normal.conf
/system/vendor/etc/thermal-engine-sgame.conf
/system/vendor/etc/thermal-engine.conf
"

##########################################################################################
# Permissions
##########################################################################################

# NOTE: This part has to be adjusted to fit your own needs

set_permissions() {
  # Default permissions, don't remove them
  set_perm_recursive  $MODPATH  0  0  0755  0644

  set_perm_recursive $MODPATH/system/vendor/etc/gps.conf 0 0 0755 0644

  # Permis Thermal
  set_perm_recursive $MODPATH/system/vendor/etc 0 0 0755 0644
  set_perm_recursive $MODPATH/System/vendor/etc/apdr.conf 0 0 0755 0644
  set_perm_recursive $MODPATH/System/vendor/etc/thermal-engine-camera.conf 0 0 0755 0644
  set_perm_recursive $MODPATH/System/vendor/etc/thermal-engine-high.conf 0 0 0755 0644
  set_perm_recursive $MODPATH/System/vendor/etc/thermal-engine-map.conf 0 0 0755 0644
  set_perm_recursive $MODPATH/System/vendor/etc/thermal-engine-nolimits.conf 0 0 0755 0644
  set_perm_recursive $MODPATH/System/vendor/etc/thermal-engine-normal.conf 0 0 0755 0644
  set_perm_recursive $MODPATH/System/vendor/etc/thermal-engine-sgame.conf 0 0 0755 0644
  set_perm_recursive $MODPATH/System/vendor/etc/thermal-engine.conf 0 0 0755 0644

  # Only some special files require specific permissions
  # The default permissions should be good enough for most cases

  # Some templates if you have no idea what to do:

  # set_perm_recursive  <dirname>                <owner> <group> <dirpermission> <filepermission> <contexts> (default: u:object_r:system_file:s0)
  # set_perm_recursive  $MODPATH/system/lib       0       0       0755            0644

  # set_perm  <filename>                         <owner> <group> <permission> <contexts> (default: u:object_r:system_file:s0)
  # set_perm  $MODPATH/system/bin/app_process32   0       2000    0755         u:object_r:zygote_exec:s0
  # set_perm  $MODPATH/system/bin/dex2oat         0       2000    0755         u:object_r:dex2oat_exec:s0
  # set_perm  $MODPATH/system/lib/libart.so       0       0       0644
}
