APP_STL := c++_shared
APP_ABI := arm64-v8a

# 强行把宏定义塞给所有的 C 文件
APP_CFLAGS := -DNON_MATCHING=1 -DVERSION_US=1 -Wno-error=implicit-function-declaration -Wno-error=int-conversion -Wno-error=constant-conversion
