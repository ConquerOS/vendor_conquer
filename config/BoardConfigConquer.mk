include vendor/conquer/config/BoardConfigKernel.mk

ifeq ($(BOARD_USES_QCOM_HARDWARE),true)
include vendor/conquer/config/BoardConfigQcom.mk
endif

include vendor/conquer/config/BoardConfigSoong.mk
