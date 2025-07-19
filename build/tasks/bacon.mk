# Copyright (C) 2017 Unlegacy-Android
# Copyright (C) 2017,2020 The LineageOS Project
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

# -----------------------------------------------------------------
# 404 OTA update package

P404_TARGET_PACKAGE := $(PRODUCT_OUT)/p404-$(P404_VERSION).zip

SHA256 := prebuilts/build-tools/path/$(HOST_PREBUILT_TAG)/sha256sum

$(P404_TARGET_PACKAGE): $(INTERNAL_OTA_PACKAGE_TARGET)
	$(hide) ln -f $(INTERNAL_OTA_PACKAGE_TARGET) $(P404_TARGET_PACKAGE)
	$(hide) $(SHA256) $(P404_TARGET_PACKAGE) | sed "s|$(PRODUCT_OUT)/||" > $(P404_TARGET_PACKAGE).sha256sum
	@echo -e ""
	echo -e ${CL_BLD}"  ____            _           _     _  _    ___  _  _   "${CL_RST}
	echo -e ${CL_BLD}" |  _ \ _ __ ___ (_) ___  ___| |_  | || |  / _ \| || |  "${CL_RST}
	echo -e ${CL_BLD}" | |_) | '__/ _ \| |/ _ \/ __| __| | || |_| | | | || |_ "${CL_RST}
	echo -e ${CL_BLD}" |  __/| | | (_) | |  __/ (__| |_  |__   _| |_| |__   _|"${CL_RST}
	echo -e ${CL_BLD}" |_|   |_|  \___// |\___|\___|\__|    |_|  \___/   |_|  "${CL_RST}
	echo -e ${CL_BLD}"               |__/                                     "${CL_RST}
	@echo -e ""
	@echo "Package Complete: $(P404_TARGET_PACKAGE)" >&2

.PHONY: bacon
bacon: $(P404_TARGET_PACKAGE) $(DEFAULT_GOAL)
