#
# Copyright (C) 2020 P404 Project
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
include vendor/404/configs/fonts.mk

# Packages
include vendor/404/configs/packages.mk

# Props
include vendor/404/configs/props.mk

# 404 Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/handheld_core_hardware.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/handheld_core_hardware.xml \
    vendor/404/configs/permissions/privapp-permissions-p404-system.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/privapp-permissions-p404.xml \
    vendor/404/configs/permissions/privapp-permissions-p404-product.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/privapp-permissions-p404.xml \
    vendor/404/configs/permissions/privapp-permissions-elgoog.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/privapp-permissions-elgoog.xml

# Android Beam
PRODUCT_COPY_FILES += \
    vendor/404/configs/permissions/android.software.nfc.beam.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.software.nfc.beam.xml

# Backup Services whitelist
PRODUCT_COPY_FILES += \
    vendor/404/configs/permissions/backup.xml:system/etc/sysconfig/backup.xml

# Bootanimation
ifeq ($(TARGET_BOOT_ANIMATION_RES),1080)
    PRODUCT_COPY_FILES += vendor/404/prebuilt/bootanimation/1080.zip:$(TARGET_COPY_OUT_PRODUCT)/media/bootanimation.zip
else ifeq ($(TARGET_BOOT_ANIMATION_RES),1440)
    PRODUCT_COPY_FILES += vendor/404/prebuilt/bootanimation/1440.zip:$(TARGET_COPY_OUT_PRODUCT)/media/bootanimation.zip
else ifeq ($(TARGET_BOOT_ANIMATION_RES),720)
    PRODUCT_COPY_FILES += vendor/404/prebuilt/bootanimation/720.zip:$(TARGET_COPY_OUT_PRODUCT)/media/bootanimation.zip
else
    ifeq ($(TARGET_BOOT_ANIMATION_RES),)
        $(warning "Project 404: TARGET_BOOT_ANIMATION_RES is undefined, assuming 1080p")
    else
        $(warning "Project 404: Current bootanimation res is not supported, forcing 1080p")
    endif
    PRODUCT_COPY_FILES += \
        vendor/404/prebuilt/bootanimation/1080.zip:$(TARGET_COPY_OUT_PRODUCT)/media/bootanimation.zip
endif

# Use ccache
USE_CCACHE := true
USE_SYSTEM_CCACHE := true
ifeq ($(filter-out true,$(USE_CCACHE)),)
  ifeq ($(filter-out true,$(USE_SYSTEM_CCACHE)),)
    CCACHE_EXEC := $(shell which ccache)
  else
    CCACHE_EXEC := prebuilts/build-tools/linux-x86/bin/ccache
  endif
endif

# Common overlays
DEVICE_PACKAGE_OVERLAYS += vendor/404/overlay

# Markup Google
PRODUCT_COPY_FILES += \
    vendor/404/prebuilt/lib/libsketchology_native.so:$(TARGET_COPY_OUT_SYSTEM)/lib/libsketchology_native.so \
    vendor/404/prebuilt/lib64/libsketchology_native.so:$(TARGET_COPY_OUT_SYSTEM)/lib64/libsketchology_native.so

# Turbo
PRODUCT_COPY_FILES += \
    vendor/404/configs/permissions/privapp-permissions-turbo.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/privapp-permissions-turbo.xml \
    vendor/404/configs/sysconfig/turbo.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/sysconfig/turbo.xml

# World APN list
PRODUCT_COPY_FILES += \
    vendor/404/prebuilt/etc/apns-conf.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/apns-conf.xml
