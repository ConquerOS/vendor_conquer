# Kernel
include vendor/conquer/config/BoardConfigKernel.mk

# Soong
include vendor/conquer/config/BoardConfigSoong.mk 


ifneq ($(TARGET_USES_PREBUILT_CAMERA_SERVICE), true) 
PRODUCT_SOONG_NAMESPACES += \
    frameworks/av/camera/cameraserver \
    frameworks/av/services/camera/libcameraservice
endif
