# Inherit mobile mini common 404 stuff
$(call inherit-product, vendor/404/config/common_mobile_mini.mk)

# Inherit tablet common 404 stuff
$(call inherit-product, vendor/404/config/tablet.mk)

$(call inherit-product, vendor/404/config/telephony.mk)
