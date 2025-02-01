LOCAL_PATH := $(call my-dir)

# Declare SDL3-Android-NativeAOT-Test module
include $(CLEAR_VARS)
LOCAL_MODULE := SDL3-Android-NativeAOT-Test
LOCAL_SRC_FILES := ../libs/$(TARGET_ARCH_ABI)/SDL3-Android-NativeAOT-Test.so
include $(PREBUILT_SHARED_LIBRARY)


include $(CLEAR_VARS)

LOCAL_MODULE := main

# Add your application source files here...
LOCAL_SRC_FILES := \
    test_android_native_aot.c

SDL_PATH := ../SDL  # SDL

LOCAL_C_INCLUDES := $(LOCAL_PATH)/$(SDL_PATH)/include  # SDL


LOCAL_SHARED_LIBRARIES := SDL3 SDL3-Android-NativeAOT-Test
LOCAL_STATIC_LIBRARIES := SDL3_test

LOCAL_LDLIBS := -lGLESv1_CM -lGLESv2 -lGLESv3  -lOpenSLES -llog -landroid  # SDL

include $(BUILD_SHARED_LIBRARY)
