#
# Copyright (C) 2020-2022 Project 404
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

# Fonts
include vendor/overlays/404/fonts.mk

# Packages
include vendor/404/configs/packages.mk

# Props
include vendor/404/configs/props.mk

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
include vendor/overlays/404/packages.mk
PRODUCT_PACKAGE_OVERLAYS += vendor/overlays/404/overlay

# CAF Common Flags :
PRODUCT_VENDOR_MOVE_ENABLED := true
DISABLE_EAP_PROXY := true

# Face Unlock
TARGET_FACE_UNLOCK_SUPPORTED ?= true
ifeq ($(TARGET_FACE_UNLOCK_SUPPORTED),true)
PRODUCT_PACKAGES += \
   FaceUnlockService
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
   ro.face_unlock_service.enabled=$(TARGET_FACE_UNLOCK_SUPPORTED)
PRODUCT_COPY_FILES += \
   frameworks/native/data/etc/android.hardware.biometrics.face.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.biometrics.face.xml
endif

# NameSpaces
PRODUCT_SOONG_NAMESPACES += vendor/qcom/opensource/commonsys/packages/apps/Bluetooth
PRODUCT_SOONG_NAMESPACES += vendor/qcom/opensource/commonsys/system/bt/conf

# QCOM
# Include Common Qualcomm Device Tree on Qualcomm Boards
$(call inherit-product-if-exists, device/qcom/common/common.mk)

# Include definitions for Snapdragon Clang
$(call inherit-product, vendor/qcom/sdclang/config/SnapdragonClang.mk)

# Sensitive Phone Numbers list
PRODUCT_COPY_FILES += \
    vendor/404/prebuilt/common/etc/sensitive_pn.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/sensitive_pn.xml

# Telephony
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)

# World APN list
PRODUCT_COPY_FILES += \
    vendor/404/prebuilt/etc/apns-conf.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/apns-conf.xml

# Copy all updater-specific init rc files
$(foreach f,$(wildcard vendor/404/prebuilt/etc/init/*.rc),\
	$(eval PRODUCT_COPY_FILES += $(f):$(TARGET_COPY_OUT_SYSTEM)/etc/init/$(notdir $f)))

# Gapps
ifeq ($(WITH_GAPPS),true)
    $(call inherit-product, vendor/gms/products/gms.mk)
endif
