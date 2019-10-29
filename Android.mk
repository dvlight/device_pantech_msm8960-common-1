LOCAL_PATH := $(call my-dir)

ifneq ($(filter ef50 ef50l ef50s ef50k ef51 ef51l ef51s ef52k ef52 ef52l ef52s ef52k,$(TARGET_DEVICE)),)

$(warning $(TARGET_DEVICE) device found for msm8960-common)

include $(call all-makefiles-under,$(LOCAL_PATH))

include $(CLEAR_VARS)

LOCAL_MODULE := wifi_symlinks
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := FAKE
LOCAL_MODULE_SUFFIX := -timestamp

include $(BUILD_SYSTEM)/base_rules.mk

endif
