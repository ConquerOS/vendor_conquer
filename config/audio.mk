ALARM_PATH := vendor/conquer/prebuilt/common/media/audio/alarms
NOTIFICATION_PATH := vendor/conquer/prebuilt/common/media/audio/notifications
RINGTONE_PATH := vendor/conquer/prebuilt/common/media/audio/ringtones
UI_PATH := vendor/conquer/prebuilt/common/media/audio/ui

# Alarms
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,$(ALARM_PATH)/,$(TARGET_COPY_OUT_PRODUCT)/media/audio/alarms/)

# Notifications
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,$(NOTIFICATION_PATH)/,$(TARGET_COPY_OUT_PRODUCT)/media/audio/notifications/)

# Ringtones
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,$(RINGTONE_PATH)/,$(TARGET_COPY_OUT_PRODUCT)/media/audio/ringtones/)

# Ui
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,$(UI_PATH)/,$(TARGET_COPY_OUT_PRODUCT)/media/audio/ui/)

# Set default audio
PRODUCT_PROPERTY_OVERRIDES += \
    ro.config.ringtone=Your_new_adventure.ogg \
    ro.config.notification_sound=Eureka.ogg \
    ro.config.alarm_alert=Fresh_start.ogg
