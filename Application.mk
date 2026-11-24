# 使用标准的 C++ 共享库，Android NDK 编译必备
APP_STL := c++_shared

# 只编译 arm64-v8a 架构，可以大幅加快编译速度，现在的手机基本都是这个架构
APP_ABI := arm64-v8a

# 👇 核心魔法：全局强行注入宏定义
# -DNON_MATCHING=1 : 解决底层 macros.h 的 IDO 报错
# -DVERSION_US=1 : 解决 audio 模块相关的变量未声明问题
# -Wno-error=... : 把那些要命的警告强行降级，防止编译中断
APP_CFLAGS := -DNON_MATCHING=1 -DVERSION_US=1 -Wno-error=implicit-function-declaration -Wno-error=int-conversion -Wno-error=constant-conversion -Wno-error=return-type
