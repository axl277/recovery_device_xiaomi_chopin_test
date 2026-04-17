#
# Copyright (C) 2021
# The PBRP (Pitch Black Recovery Project)
#
# Licensed under the Apache License, Version 2.0
# http://www.apache.org/licenses/LICENSE-2.0
#

# Base configuration
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/base.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/gsi_keys.mk)

# Common PBRP configuration
$(call inherit-product, vendor/pb/config/common.mk)

# Device-specific configuration
$(call inherit-product, device/xiaomi/chopin/device.mk)

# Device identity
PRODUCT_DEVICE := chopin
PRODUCT_NAME := pbrp_chopin
PRODUCT_BRAND := POCO
PRODUCT_MODEL := 21061110AG
PRODUCT_MANUFACTURER := Xiaomi

# PBRP-specific flags
PBRP_MAINTAINER := Axlorin
PBRP_DEVICE := chopin
PBRP_VERSION := 4.0
