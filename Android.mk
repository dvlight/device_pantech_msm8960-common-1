LOCAL_PATH := $(call my-dir)

ifneq ($(filter ef52 ef52l ef52s ef52k a870 a870l a870s a870k,$(TARGET_DEVICE)),)

$(warning $(TARGET_DEVICE) device found for iron-common)

include $(BUILD_SYSTEM)/base_rules.mk

include $(call all-makefiles-under,$(LOCAL_PATH))

include $(CLEAR_VARS)

endif
