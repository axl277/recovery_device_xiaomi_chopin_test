#
# Copyright (C) 2021 The TWRP Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Specify API Shipping Level (Android 11 / API 30 for Xiaomi Chopin stock launch)
PRODUCT_SHIPPING_API_LEVEL := 30

# Enable Dynamic Partitions Support
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# Enable Virtual A/B OTA Support (Required if building for VAB ROMs)
ENABLE_VIRTUAL_AB := true
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota.mk)

# A/B OTA Updater Packages
AB_OTA_UPDATER := true
AB_OTA_PARTITIONS += \
    boot \
    dtbo \
    system \
    system_ext \
    product \
    vendor \
    odm \
    vbmeta \
    vbmeta_system \
    vbmeta_vendor

PRODUCT_PACKAGES += \
    update_engine \
    update_engine_sideload \
    update_verifier

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/mtk_plpath_utils \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true

# MediaTek Boot Control HAL
PRODUCT_PACKAGES += \
    android.hardware.boot@1.2-mtkimpl.recovery \
    android.hardware.boot@1.2-mtkimpl \
    libmtk_bsg.recovery

PRODUCT_PACKAGES_DEBUG += \
    bootctl

# Fastbootd Daemon & HAL
PRODUCT_PACKAGES += \
    android.hardware.fastboot@1.0-impl-mock \
    fastbootd

# Health HAL Services
PRODUCT_PACKAGES += \
    android.hardware.health@2.1-impl \
    android.hardware.health@2.1-service

# Keymaster & Keymint Decryption HALs (FBE v2 support for Android 14+)
PRODUCT_PACKAGES += \
    android.hardware.security.keymint-service \
    android.hardware.gatekeeper@1.0-service \
    android.hardware.gatekeeper@1.0-impl \
    keystore.default \
    vold_decrypt

# Additional Target Decryption Libraries
TARGET_RECOVERY_DEVICE_MODULES += \
    libkeymaster4 \
    libkeymaster41 \
    libpuresoftkeymasterdevice \
    libkeymint

# Relink Required Shared Libraries into Recovery Ramdisk
TW_RECOVERY_ADDITIONAL_RELINK_LIBRARY_FILES += \
    $(TARGET_OUT_SHARED_LIBRARIES)/libkeymaster4.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libkeymaster41.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libpuresoftkeymasterdevice.so
