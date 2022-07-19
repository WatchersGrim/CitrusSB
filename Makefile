export SDKVERSION=13.7

THEOS_DEVICE_IP = 192.168.154.73

TARGET := iphone:clang:latest:7.0
INSTALL_TARGET_PROCESSES = SpringBoard

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = CitrusSB

CitrusSB_FILES = Tweak.x
CitrusSB_CFLAGS = -fobjc-arc
CitrusSB_EXTRA_FRAMEWORKS += Cephei

include $(THEOS_MAKE_PATH)/tweak.mk
SUBPROJECTS += citrussbpref
include $(THEOS_MAKE_PATH)/aggregate.mk
