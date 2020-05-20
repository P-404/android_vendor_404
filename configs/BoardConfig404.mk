# Kernel
include vendor/404/configs/BoardConfigKernel.mk

# Qcom-specific bits
ifeq ($(BOARD_USES_QCOM_HARDWARE),true)
include vendor/404/configs/BoardConfigQcom.mk
endif

# Soong
include vendor/404/configs/BoardConfigSoong.mk
