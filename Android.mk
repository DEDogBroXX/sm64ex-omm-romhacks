LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)
LOCAL_MODULE := main

LOCAL_C_INCLUDES := $(LOCAL_PATH)/include $(LOCAL_PATH)/src $(LOCAL_PATH)/build/us_pc $(LOCAL_PATH)/build/us_pc/include

LOCAL_SRC_FILES := $(patsubst $(LOCAL_PATH)/%, %, $(wildcard $(LOCAL_PATH)/src/*.c))
LOCAL_SRC_FILES += $(patsubst $(LOCAL_PATH)/%, %, $(wildcard $(LOCAL_PATH)/src/*/*.c))
LOCAL_SRC_FILES += $(patsubst $(LOCAL_PATH)/%, %, $(wildcard $(LOCAL_PATH)/src/*/*/*.c))
LOCAL_SRC_FILES += $(patsubst $(LOCAL_PATH)/%, %, $(wildcard $(LOCAL_PATH)/src/*/*/*/*.c))
LOCAL_SRC_FILES += $(patsubst $(LOCAL_PATH)/%, %, $(wildcard $(LOCAL_PATH)/data/omm/*.c))
LOCAL_SRC_FILES += $(patsubst $(LOCAL_PATH)/%, %, $(wildcard $(LOCAL_PATH)/data/omm/*/*.c))
LOCAL_SRC_FILES += $(patsubst $(LOCAL_PATH)/%, %, $(wildcard $(LOCAL_PATH)/data/omm/*/*/*.c))

LOCAL_LDLIBS := -llog -landroid -lEGL -lGLESv1_CM -lOpenSLES
LOCAL_SHARED_LIBRARIES := SDL2

include $(BUILD_SHARED_LIBRARY)
