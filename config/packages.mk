#
# Copyright (C) The ConquerOS Project
#

# Build ConquerOS Required Apps
PRODUCT_PACKAGES += \
    ExactCalculator \
    Gallery2 \
    LatinIME \
    messaging

# Config
PRODUCT_PACKAGES += \
    SimpleDeviceConfig

# Customizations
PRODUCT_PACKAGES += \
    IconShapeSquareOverlay \
    NavigationBarMode2ButtonOverlay

# Telephony packages
PRODUCT_PACKAGES += \
    Stk

# Root
PRODUCT_PACKAGES += \
    adb_root
ifneq ($(TARGET_BUILD_VARIANT),user)
ifeq ($(WITH_SU),true)
PRODUCT_PACKAGES += \
    su
endif
endif

# SystemUI plugins
PRODUCT_PACKAGES += \
    QuickAccessWallet

# World APN list
PRODUCT_PACKAGES += \
    apns-conf.xml
