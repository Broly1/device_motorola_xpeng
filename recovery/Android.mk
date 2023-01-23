LOCAL_PATH := $(call my-dir)

# Recovery-Stuffs

include $(CLEAR_VARS)
LOCAL_MODULE       := init.recovery.xpeng.rc
LOCAL_MODULE_TAGS  := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES    := etc/init.recovery.xpeng.rc
LOCAL_MODULE_PATH  := $(TARGET_RECOVERY_ROOT_OUT)/
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE       := load_touch.sh
LOCAL_MODULE_TAGS  := optional
LOCAL_MODULE_TAGS  := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES    := bin/load_touch.sh
LOCAL_MODULE_PATH  := $(TARGET_RECOVERY_ROOT_OUT)/vendor/bin/
include $(BUILD_PREBUILT)
