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
MODID=Exp_Mod

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
  sleep 5
  ui_print " Starting Instal "
  #Start
  sleep 1
  ui_print " Light Tweak "
  sleep 3
  ui_print "************************"
  ui_print "* Tweak Costum By MoeZu *"
  ui_print "* -Audio    Set         *"
  ui_print "* -Boot     not         *"
  ui_print "* -Dalvik   not         *"
  ui_print "* -Device   not         *"
  ui_print "* -Display  not         *"
  ui_print "* -Internet not         *"
  ui_print "* -Picture  not         *"
  ui_print "* -Sound    Set         *"
  ui_print "* -Touch    not         *"
  ui_print "************************"
  sleep 1
  ui_print " Zram Upping D0 4GB + D1 1GB + D2 1GB "
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
sleep 5
echo "Installation Completed"
echo " "
sleep 3
ui_print "Reboot For Perfect Completed!!"
}

# Copy/extract your module files into $MODPATH in on_install.

on_install() {
  # The following is the default implementation: extract $ZIPFILE/system to $MODPATH
  # Extend/change the logic to whatever you want
  ui_print "- Extracting module files"
  unzip -o "$ZIPFILE" 'system/*' -d $MODPATH >&2
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
/system/app/AnalyticsCore
/system/app/MSA-CN-NO_INSTALL_PACKAGE
/system/app/mab
/system/app/MSA
/system/app/MSA-Global
/system/app/Stk
/system/etc/cust
/system/data-app
/system/priv-app/MiGameCenterSDKService
/system/vendor/overlay/SysuiDarkTheme
/system/vendor/overlay/DisplayCutoutEmulationTall
/system/vendor/overlay/DisplayCutoutEmulationDouble
/system/vendor/overlay/DisplayCutoutEmulationCorner
/system/vendor/etc/thermal-engine.conf
/system/etc/thermal-engine.conf
/system/etc/doublepowwer
/system/vendor/etc/init.qcom.post_boot.sh
"

##########################################################################################
# Permissions
##########################################################################################

# NOTE: This part has to be adjusted to fit your own needs

set_permissions() {
  # Default permissions, don't remove them
  set_perm_recursive  $MODPATH  0  0  0755  0644
  set_perm_recursive $MODPATH/system/bin 0 0 0755 0755
  set_perm $MODPATH/system/lib/egl/egl.cfg 0 0 0644
  set_perm_recursive $MODPATH/system/etc 0 0 0755 0644
  set_perm_recursive $MODPATH/System/vendor/etc/thermal-engine-normal.conf 0 0 0755 0644
  set_perm_recursive $MODPATH/System/lib/GL-Extensions 0 0 0755 0644
  # Only some special files require specific permissions
  # The default permissions should be good enough for most cases

  # Some templates if you have no idea what to do:

  # set_perm_recursive  <dirname>                <owner> <group> <dirpermission> <filepermission> <contexts> (default: u:object_r:system_file:s0)
  # set_perm_recursive  $MODPATH/system/lib       0       0       0755            0644

  # set_perm  <filename>                         <owner> <group> <permission> <contexts> (default: u:object_r:system_file:s0)
  # set_perm  $MODPATH/system/bin/app_process32   0       2000    0755         u:object_r:zygote_exec:s0
  # set_perm  $MODPATH/system/bin/dex2oat         0       2000    0755         u:object_r:dex2oat_exec:s0
  # set_perm  $MODPATH/system/lib/libart.so       0       0       0644
  set_perm  $MODPATH/system/bin/daemon 0 0 0755

  # The following is default permissions, DO NOT remove
  set_perm  $MODPATH/system/vendor/etc/thermal-engine.conf  0  0  0644
  set_perm  $MODPATH/system/etc/thermal-engine.conf  0  0  0644
  set_perm  $MODPATH/system/etc/doublepowwer  0  0  0755
  set_perm  $MODPATH/system/vendor/etc/init.qcom.post_boot.sh  0  0  0777
}

