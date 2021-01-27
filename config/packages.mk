#
# Copyright (C) The ConquerOS Project
#

# Prebuilt Google Apps
ifeq ($(TARGET_USE_GAPPS), false)
# Build ConquerOS Required Apps
PRODUCT_PACKAGES += \
    ExactCalculator \
    Gallery2 \
    LatinIME \
    messaging
endif

# Config
PRODUCT_PACKAGES += \
    SimpleDeviceConfig

# ConquerOS Features
PRODUCT_PACKAGES += \
    StitchImage

# Customizations
PRODUCT_PACKAGES += \
    IconShapeSquareOverlay \
    NavigationBarMode2ButtonOverlay

# Hotspot Client manager
PRODUCT_PACKAGES += \
    SoftAPManager

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
