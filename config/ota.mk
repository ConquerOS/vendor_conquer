ifeq ($(CONQUER_BUILD_TYPE), OFFICIAL)

PRODUCT_PACKAGES += \
    Updater

PRODUCT_COPY_FILES += \
    vendor/conquer/config/permissions/com.conquer.updater.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/com.conquer.updater.xml

endif
