# Inherit mobile full common 404 stuff
$(call inherit-product, vendor/404/config/common_mobile_full.mk)

# Enable support of one-handed mode
PRODUCT_PRODUCT_PROPERTIES += \
    ro.support_one_handed_mode?=true

$(call inherit-product, vendor/404/config/telephony.mk)
