# Based on the OFRP agate vendorsetup.sh (OrangeFox Recovery Project, GPL-3.0-only)

FDEVICE="chopin"

fox_get_target_device() {
local chkdev=$(echo "$BASH_SOURCE" | grep -w $FDEVICE)
   if [ -n "$chkdev" ]; then 
      FOX_BUILD_DEVICE="$FDEVICE"
   else
      chkdev=$(set | grep BASH_ARGV | grep -w $FDEVICE)
      [ -n "$chkdev" ] && FOX_BUILD_DEVICE="$FDEVICE"
   fi
}

if [ -z "$1" -a -z "$FOX_BUILD_DEVICE" ]; then
   fox_get_target_device
fi

if [ "$1" = "$FDEVICE" -o "$FOX_BUILD_DEVICE" = "$FDEVICE" ]; then

# Build
export TW_DEFAULT_LANGUAGE="en"
export LC_ALL="C"
export ALLOW_MISSING_DEPENDENCIES=true

# Partitions
export FOX_RECOVERY_HAS_DYNAMIC_PARTITIONS=1
export FOX_VIRTUAL_AB_DEVICE=1
export OF_ENABLE_ALL_PARTITION_TOOLS=1

# Binaries & Tools
export FOX_USE_UPDATED_MAGISKBOOT=1
export FOX_USE_ZSTD_BINARY=1
export FOX_USE_ZIP_BINARY=1
export FOX_USE_XZ_UTILS=1
export FOX_USE_TAR_BINARY=1
export FOX_USE_SED_BINARY=1
export FOX_USE_NANO_EDITOR=1
export FOX_USE_GREP_BINARY=1
export FOX_USE_BUSYBOX_BINARY=1
export FOX_USE_BASH_SHELL=1
export FOX_BASH_TO_SYSTEM_BIN=1
export FOX_REPLACE_TOOLBOX_GETPROP=1
export FOX_ASH_IS_BASH=1
export FOX_DELETE_AROMAFM=1
export FOX_ENABLE_APP_MANAGER=1

# Maintainer & Build Info
export FOX_BUILD_TYPE="Testing"
export FOX_MAINTAINER_PATCH_VERSION="1"
export OF_MAINTAINER="Clorizz"
	
else
   if [ -z "$FOX_BUILD_DEVICE" -a -z "$BASH_SOURCE" ]; then
      echo "I: This script requires bash. Not processing the $FDEVICE $(basename $0)"
   fi
fi
