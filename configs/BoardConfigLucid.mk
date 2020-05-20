# Kernel
include vendor/p404/configs/BoardConfigKernel.mk

# Qcom-specific bits
ifeq ($(BOARD_USES_QCOM_HARDWARE),true)
include vendor/p404/configs/BoardConfigQcom.mk
endif

# Soong
include vendor/p404/configs/BoardConfigSoong.mk
