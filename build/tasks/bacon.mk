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

# -----------------------------------------------------------------
# PP404 OTA update package

P404_TARGET_PACKAGE := $(PRODUCT_OUT)/project-404-$(P404_VERSION).zip

SHA256 := prebuilts/build-tools/path/$(HOST_PREBUILT_TAG)/sha256sum

.PHONY: bacon
bacon: $(INTERNAL_OTA_PACKAGE_TARGET)
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
	@echo -e ${CL_BLD}${CL_CYN}"===============================-Package complete-==============================="${CL_RED}
	@echo -e ${CL_BLD}${CL_CYN}"Zip: "${CL_YLW} $(P404_TARGET_PACKAGE)${CL_RST}
	@echo -e ${CL_BLD}${CL_CYN}"SHA256: "${CL_YLW}" `cat $(P404_TARGET_PACKAGE).sha256sum | awk '{print $$1}' `"${CL_RST}
	@echo -e ${CL_BLD}${CL_CYN}"Size:"${CL_YLW}" `du -sh $(P404_TARGET_PACKAGE) | awk '{print $$1}' `"${CL_RST}
	@echo -e ${CL_BLD}${CL_CYN}"Size in Int:"${CL_YLW}" `wc -c $(P404_TARGET_PACKAGE) | awk '{print $$1}' `"${CL_RST}
	@echo -e ${CL_BLD}${CL_CYN}"TimeStamp:"${CL_YLW}" `cat $(PRODUCT_OUT)/system/build.prop | grep ro.build.date.utc | cut -d'=' -f2 | awk '{print $$1}' `"${CL_RST}
	@echo -e ${CL_BLD}${CL_CYN}"================================================================================"${CL_RED}
