LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE := main

SDL_PATH := ../SDL

IMGUI_PATH := ../../../../../

LOCAL_C_INCLUDES := $(LOCAL_PATH)/$(SDL_PATH)/include \
	$(LOCAL_PATH)/$(IMGUI_PATH)

# Add your application source files here...
LOCAL_SRC_FILES := DearImGuiDemo.cpp \
	imgui_impl_sdl.cpp \
	imgui_impl_opengl3.cpp \
	$(LOCAL_PATH)/$(IMGUI_PATH)/imgui.cpp \
	$(LOCAL_PATH)/$(IMGUI_PATH)/imgui_demo.cpp \
	$(LOCAL_PATH)/$(IMGUI_PATH)/imgui_draw.cpp \
	$(LOCAL_PATH)/$(IMGUI_PATH)/imgui_widgets.cpp

LOCAL_SHARED_LIBRARIES := SDL2

LOCAL_LDLIBS := -lGLESv1_CM -lGLESv2 -lGLESv3 -llog

include $(BUILD_SHARED_LIBRARY)
