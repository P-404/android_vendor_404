#
# Copyright (C) 2020 Project 404
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

# Branding stuffs
P404_VERSION_MAJ := 3
P404_VERSION_MIN := 0

P404_VERSION_CODE := MISCUE

P404_BUILD_NUMBER := LPBN.Q0202.$(shell date -u +%d).$(shell date -u +%m)001

ifndef P404_BUILDTYPE
  P404_BUILDTYPE := unofficial
endif

P404_VERSION := $(P404_VERSION_MAJ).$(P404_VERSION_MIN)-$(shell date -u +%Y%m%d-%H%M%S)-$(P404_BUILDTYPE)-$(P404_BUILD)
P404_DISPLAY_VERSION := $(P404_VERSION_MAJ).$(P404_VERSION_MIN)

# Branding Props
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.404.version=$(P404_DISPLAY_VERSION) \
    ro.404.version_code=$(P404_VERSION_CODE) \
    ro.404.device=$(P404_BUILD) \
    ro.404.display.version=$(P404_DISPLAY_VERSION) \
    ro.404.releasetype=$(P404_BUILDTYPE) \
    ro.404.build=$(P404_BUILD_NUMBER)
