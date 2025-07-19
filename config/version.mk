P404_BUILD_TYPE ?= Community
P404_VERSION := bijin

# Set P404_BUILD_TYPE from the env RELEASE_TYPE, for jenkins compat
P404_DATE_YEAR := $(shell date -u +%Y)
P404_DATE_MONTH := $(shell date -u +%m)
P404_DATE_DAY := $(shell date -u +%d)
P404_DATE_HOUR := $(shell date -u +%H)
P404_DATE_MINUTE := $(shell date -u +%M)

P404_BUILD_DATE_UTC := $(shell date -d '$(P404_DATE_YEAR)-$(P404_DATE_MONTH)-$(P404_DATE_DAY) $(P404_DATE_HOUR):$(P404_DATE_MINUTE)' -u +%s)

# Display version
P404_DISPLAY_VERSION := P404-$(P404_VERSION)-$(shell date +%Y%m%d)-$(P404_BUILD)-$(P404_BUILD_TYPE)

# Platform Display version
P404_PLATFORM_DISPLAY_VERSION := $(P404_VERSION)-$(shell date +%Y%m%d)-$(P404_BUILD)-$(P404_BUILD_TYPE)

# 404 version properties
PRODUCT_SYSTEM_PROPERTIES += \
    ro.p404.version=$(P404_VERSION) \
    ro.p404.display.version=$(P404_DISPLAY_VERSION) \
    ro.p404.build.version=$(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR) \
    ro.p404.releasetype=$(P404_BUILDTYPE)
