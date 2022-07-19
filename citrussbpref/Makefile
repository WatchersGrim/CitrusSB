include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = CitrusSBPref

CitrusSBPref_FILES = CSBPrefRootListController.m
CitrusSBPref_FRAMEWORKS = UIKit
CitrusSBPref_PRIVATE_FRAMEWORKS = Preferences
CitrusSBPref_INSTALL_PATH = /Library/PreferenceBundles
CitrusSBPref_CFLAGS = -fobjc-arc
CitrusSBPref_EXTRA_FRAMEWORKS += Cephei CepheiPrefs

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)midair -p "$(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences"$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist "$(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/CitrusSB.plist"$(ECHO_END)
