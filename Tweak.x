#import <CoreFoundation/CoreFoundation.h>
#import <Foundation/Foundation.h>
#import <Foundation/NSUserDefaults+Private.h>

static NSString * nsDomainString = @"com.watchersgrim.citrussb";
static NSString * nsNotificationString = @"com.watchersgrim.citrussb/preferences.changed";

static BOOL isEnabled;
NSString* carrierLabel;

static void notificationCallback(CFNotificationCenterRef center, void *observer, CFStringRef name, const void *object, CFDictionaryRef userInfo) {
	
	NSNumber* enabledValue = (NSNumber *)[[NSUserDefaults standardUserDefaults] objectForKey:@"isEnabled" inDomain:nsDomainString];
	isEnabled = (enabledValue) ? [enabledValue boolValue] : YES;

	NSString* carrier = (NSString *)[[NSUserDefaults standardUserDefaults] objectForKey:@"carrierLabel" inDomain:nsDomainString];
	carrierLabel = carrier;
}

%group CustomStatusBar

/*
%hook _UIStatusBarStringView

-(void)setText:(id)arg1 {

    // This method will only work if you're trying to change the Time or Battery string

    %orig(arg1);
}
%end */

%hook _UIStatusBarDataCellularEntry

- (void)setString:(id)arg1 {

	NSString* defualtCarrier = arg1;
	
	if (![carrierLabel isEqualToString:@""] && !(carrierLabel == nil)) {

		arg1 = carrierLabel; 
    }
	else {
		arg1 = defualtCarrier;
	}

	%orig(arg1);
}
%end
%end

%ctor {
	// Set variables on start up
	notificationCallback(NULL, NULL, NULL, NULL, NULL);

	// Register for 'PostNotification' notifications
	CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, notificationCallback, (CFStringRef)nsNotificationString, NULL, CFNotificationSuspensionBehaviorCoalesce);

	// Add any personal initializations
    if (isEnabled) {
        %init(CustomStatusBar);
    } 
}
