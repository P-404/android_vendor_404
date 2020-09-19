#
# Copyright (C) 2020-2021 Project 404
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Inherit art options
include vendor/404/configs/art.mk

# Branding stuffs
include vendor/404/configs/branding.mk

# Packages
include vendor/404/configs/packages.mk

# Props
include vendor/404/configs/props.mk

# 404 Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/handheld_core_hardware.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/handheld_core_hardware.xml \

# Android Beam
PRODUCT_COPY_FILES += \
    vendor/404/configs/permissions/android.software.nfc.beam.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.software.nfc.beam.xml

# Backup Services whitelist
PRODUCT_COPY_FILES += \
    vendor/404/configs/permissions/backup.xml:system/etc/sysconfig/backup.xml

# Backup Tool
PRODUCT_COPY_FILES += \
    vendor/404/prebuilt/common/bin/backuptool.sh:install/bin/backuptool.sh \
    vendor/404/prebuilt/common/bin/backuptool.functions:install/bin/backuptool.functions \
    vendor/404/prebuilt/common/bin/50-base.sh:$(TARGET_COPY_OUT_SYSTEM)/addon.d/50-base.sh

ifneq ($(AB_OTA_PARTITIONS),)
PRODUCT_COPY_FILES += \
    vendor/404/prebuilt/common/bin/backuptool_ab.sh:$(TARGET_COPY_OUT_SYSTEM)/bin/backuptool_ab.sh \
    vendor/404/prebuilt/common/bin/backuptool_ab.functions:$(TARGET_COPY_OUT_SYSTEM)/bin/backuptool_ab.functions \
    vendor/404/prebuilt/common/bin/backuptool_postinstall.sh:$(TARGET_COPY_OUT_SYSTEM)/bin/backuptool_postinstall.sh
endif

# Bootanimation
ifeq ($(TARGET_BOOT_ANIMATION_RES),1080)
    PRODUCT_COPY_FILES += vendor/404/prebuilt/bootanimation/1080.zip:$(TARGET_COPY_OUT_SYSTEM)/media/bootanimation.zip
else ifeq ($(TARGET_BOOT_ANIMATION_RES),1440)
    PRODUCT_COPY_FILES += vendor/404/prebuilt/bootanimation/1440.zip:$(TARGET_COPY_OUT_SYSTEM)/media/bootanimation.zip
else ifeq ($(TARGET_BOOT_ANIMATION_RES),720)
    PRODUCT_COPY_FILES += vendor/404/prebuilt/bootanimation/720.zip:$(TARGET_COPY_OUT_SYSTEM)/media/bootanimation.zip
else
    ifeq ($(TARGET_BOOT_ANIMATION_RES),)
        $(warning "Project 404: TARGET_BOOT_ANIMATION_RES is undefined, assuming 1080p")
    else
        $(warning "Project 404: Current bootanimation res is not supported, forcing 1080p")
    endif
    PRODUCT_COPY_FILES += \
        vendor/404/prebuilt/bootanimation/1080.zip:$(TARGET_COPY_OUT_SYSTEM)/media/bootanimation.zip
endif

# Common overlays
DEVICE_PACKAGE_OVERLAYS += vendor/overlays/404/overlay

# Recommend using the non debug dexpreopter
USE_DEX2OAT_DEBUG ?= false

# CAF Common Flags :
PRODUCT_VENDOR_MOVE_ENABLED := true
DISABLE_EAP_PROXY := true

# NameSpaces
ifeq ($(TARGET_USE_QTI_BT_STACK),true)
PRODUCT_SOONG_NAMESPACES += vendor/qcom/opensource/commonsys/packages/apps/Bluetooth
endif #TARGET_USE_QTI_BT_STACK
PRODUCT_SOONG_NAMESPACES += vendor/qcom/opensource/commonsys/system/bt/conf

# QCOM
include vendor/404/configs/utils.mk
# Include Common Qualcomm Device Tree on Qualcomm Boards
$(call inherit-product-if-exists, device/qcom/common/common.mk)

# QCOM Vendor
-include vendor/qcom/defs/board-defs/system/*.mk
-include vendor/qcom/defs/board-defs/vendor/*.mk
$(call inherit-product-if-exists, vendor/qcom/defs/product-defs/system/*.mk)
$(call inherit-product-if-exists, vendor/qcom/defs/product-defs/vendor/*.mk)

# Include definitions for Snapdragon Clang
$(call inherit-product, vendor/qcom/sdclang/config/SnapdragonClang.mk)

# Sensitive Phone Numbers list
PRODUCT_COPY_FILES += \
    vendor/404/prebuilt/common/etc/sensitive_pn.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/sensitive_pn.xml

# Telephony
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# World APN list
PRODUCT_COPY_FILES += \
    vendor/404/prebuilt/etc/apns-conf.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/apns-conf.xml

# Copy all updater-specific init rc files
$(foreach f,$(wildcard vendor/404/prebuilt/etc/init/*.rc),\
	$(eval PRODUCT_COPY_FILES += $(f):$(TARGET_COPY_OUT_SYSTEM)/etc/init/$(notdir $f)))

# Treble
# Enable ALLOW_MISSING_DEPENDENCIES on Vendorless Builds
ifeq ($(BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE),)
  ALLOW_MISSING_DEPENDENCIES := true
endif
