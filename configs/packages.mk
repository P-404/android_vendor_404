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

# Charger
PRODUCT_PACKAGES += \
    p404_charger \
    p404_charger_vendor

# Filesystems tools
PRODUCT_PACKAGES += \
    fsck.ntfs \
    mkfs.ntfs \
    mount.ntfs \
    fsck.exfat \
    mkfs.exfat

# 404 Packages
PRODUCT_PACKAGES += \
    P404Launcher \
    ExactCalculator \
    Covers \
    ThemePicker \
    Updater \
    Aperture \
    RepainterServicePriv

# SystemUI plugins
PRODUCT_PACKAGES += \
    QuickAccessWallet


# Config
PRODUCT_PACKAGES += \
    SimpleDeviceConfig

# Framework detect libs
PRODUCT_PACKAGES += \
    libvndfwk_detect_jni.qti \
    libqti_vndfwk_detect \
    libvndfwk_detect_jni.qti.vendor \
    libqti_vndfwk_detect.vendor

# HIDL
PRODUCT_PACKAGES += \
    android.hidl.base@1.0 \
    android.hidl.base@1.0.vendor \
    android.hidl.manager@1.0 \
    android.hidl.manager@1.0.vendor

# WiFi
PRODUCT_PACKAGES += \
    libwpa_client
