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

# Include support for additional filesystems
PRODUCT_PACKAGES += \
    e2fsck \
    mke2fs \
    tune2fs \
    mount.exfat \
    fsck.exfat \
    mkfs.exfat \
    ntfsfix \
    ntfs-3g

# P404 Packages
PRODUCT_PACKAGES += \
    P404Launcher \
    Longshot \
    MarkupGoogle \
    SettingsIntelligenceGooglePrebuilt \
    ThemePicker \
    P404ThemesStub

# Project 404 Overlays
PRODUCT_PACKAGES += p404-overlays

# FontOverlays
PRODUCT_PACKAGES += \
    FontGoogleSansOverlay

# Device Personalization Services
PRODUCT_PACKAGES += MatchmakerPrebuilt

# Offline charger
PRODUCT_PACKAGES += \
    charger_res_images \
    product_charger_res_images

# Telephony
PRODUCT_PACKAGES += \
    messaging \
    Stk \
    CellBroadcastReceiver
