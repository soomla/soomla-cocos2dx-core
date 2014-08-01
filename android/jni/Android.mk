LOCAL_PATH := $(call my-dir)

# cocos2dx-soomla-common
include $(CLEAR_VARS)

LOCAL_MODULE := cocos2dx_soomla_common_static
LOCAL_MODULE_FILENAME := libcocos2dxsoomlacommon
LOCAL_SRC_FILES := ../../Soomla/CCCommonConsts.cpp \
	../../Soomla/CCCoreEventDispatcher.cpp \
	../../Soomla/CCCoreService.cpp \
	../../Soomla/CCDomainFactory.cpp \
	../../Soomla/CCDomainHelper.cpp \
	../../Soomla/CCError.cpp \
	../../Soomla/CCJsonHelper.cpp \
	../../Soomla/CCNdkBridge.cpp \
	../../Soomla/CCServiceManager.cpp \
	../../Soomla/CCSoomlaEventDispatcher.cpp \
	../../Soomla/domain/CCDomain.cpp \
	../../Soomla/domain/CCSoomlaEntity.cpp \
	../../Soomla/rewards/CCAggregateReward.cpp \
	../../Soomla/rewards/CCBadgeReward.cpp \
	../../Soomla/rewards/CCRandomReward.cpp \
	../../Soomla/rewards/CCReward.cpp \
	../../Soomla/rewards/CCSequenceReward.cpp

LOCAL_C_INCLUDES := $(LOCAL_PATH)/../../Soomla
LOCAL_C_INCLUDES += $(LOCAL_PATH)/../../Soomla/domain
LOCAL_C_INCLUDES += $(LOCAL_PATH)/../../Soomla/rewards

LOCAL_WHOLE_STATIC_LIBRARIES += cocos2dx_static
LOCAL_WHOLE_STATIC_LIBRARIES += jansson_static


LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)/../..
LOCAL_EXPORT_C_INCLUDES += $(LOCAL_PATH)/../../Soomla
LOCAL_EXPORT_C_INCLUDES += $(LOCAL_PATH)/../../Soomla/domain
LOCAL_EXPORT_C_INCLUDES += $(LOCAL_PATH)/../../Soomla/rewards

include $(BUILD_STATIC_LIBRARY)

$(call import-module,jansson)
