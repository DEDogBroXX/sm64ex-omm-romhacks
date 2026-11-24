LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)

# 模块名称必须叫 main
LOCAL_MODULE := main

# 头文件包含路径
LOCAL_C_INCLUDES := \
    $(LOCAL_PATH)/include \
    $(LOCAL_PATH)/src \
    $(LOCAL_PATH)/build/us_pc \
    $(LOCAL_PATH)/build/us_pc/include \
    $(LOCAL_PATH)/data/omm/engine/headers \
    $(LOCAL_PATH)/data/omm/engine/headers/include \
    $(LOCAL_PATH)/data/omm/engine/headers/src \
    $(LOCAL_PATH)/data/omm/engine/headers/src/engine \
    $(LOCAL_PATH)/data/omm/engine/headers/src/extras \
    $(LOCAL_PATH)/data/omm/engine/headers/src/game \
    $(LOCAL_PATH)/data/omm/engine/headers/src/menu \
    $(LOCAL_PATH)/data/omm/engine/headers/src/pc

# 👇 核心魔法：编译参数传递
# -DNON_MATCHING=1 : 干掉那个该死的 IDO 编译器检查 (#error)
# -DVERSION_US=1 : 启用美版代码分支，解决变量未声明问题
# -Wno-error=... : 把各种隐式转换、未声明的警告降级，不让它们中断编译
LOCAL_CFLAGS := -DNON_MATCHING=1 -DVERSION_US=1 -Wno-error=implicit-function-declaration -Wno-error=int-conversion -Wno-error=constant-conversion -Wno-error

# 自动扫描所有子目录下的 .c 文件
LOCAL_SRC_FILES := $(patsubst $(LOCAL_PATH)/%, %, $(wildcard $(LOCAL_PATH)/src/*.c))
LOCAL_SRC_FILES += $(patsubst $(LOCAL_PATH)/%, %, $(wildcard $(LOCAL_PATH)/src/*/*.c))
LOCAL_SRC_FILES += $(patsubst $(LOCAL_PATH)/%, %, $(wildcard $(LOCAL_PATH)/src/*/*/*.c))
LOCAL_SRC_FILES += $(patsubst $(LOCAL_PATH)/%, %, $(wildcard $(LOCAL_PATH)/src/*/*/*/*.c))
LOCAL_SRC_FILES += $(patsubst $(LOCAL_PATH)/%, %, $(wildcard $(LOCAL_PATH)/data/omm/*.c))
LOCAL_SRC_FILES += $(patsubst $(LOCAL_PATH)/%, %, $(wildcard $(LOCAL_PATH)/data/omm/*/*.c))
LOCAL_SRC_FILES += $(patsubst $(LOCAL_PATH)/%, %, $(wildcard $(LOCAL_PATH)/data/omm/*/*/*.c))

# 依赖的系统库
LOCAL_LDLIBS := -llog -landroid -lEGL -lGLESv1_CM -lOpenSLES

# 链接 SDL2 动态库
LOCAL_SHARED_LIBRARIES := SDL2

include $(BUILD_SHARED_LIBRARY)
