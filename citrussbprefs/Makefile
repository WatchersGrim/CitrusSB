ARCHS = arm64 arm64e
TARGET := iphone:clang:latest:latest

include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = CitrusSBPrefs

CitrusSBPrefs_FILES = CSBPrefRootListController.m
CitrusSBPrefs_FRAMEWORKS = UIKit
CitrusSBPrefs_PRIVATE_FRAMEWORKS = Preferences
CitrusSBPrefs_INSTALL_PATH = /Library/PreferenceBundles
CitrusSBPrefs_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/bundle.mk
