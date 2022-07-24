ARCHS = arm64 arm64e
TARGET := iphone:clang:latest:latest
INSTALL_TARGET_PROCESSES = SpringBoard

FINALPACKAGE = 1

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = CitrusSB

CitrusSB_FILES = Tweak.x
CitrusSB_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
SUBPROJECTS += citrussbprefs
include $(THEOS_MAKE_PATH)/aggregate.mk
