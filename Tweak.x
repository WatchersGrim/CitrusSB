#import "Tweak.h"

NSString *CSBStatusLabel;
BOOL Enabled = YES;

HBPreferences *preferences;

%group CustomStatusBar

%hook _UIStatusBarStringView


-(void)setText:(id)arg1 {
    if ([arg1 isKindOfClass:[NSString class]] && ![arg1 containsString:@"%"] && ![arg1 containsString:@":"] && Enabled == YES) {
         NSLog(@"Found: %@", arg1);
         %orig(CSBStatusLabel);
   }
   else {
       %orig(arg1);
   }
}

%end /* end hook */

%end /* end group */

static void loadPrefs() {
	preferences = [[HBPreferences alloc] initWithIdentifier:@"com.watchersgrim.citrussbpref"];

	[preferences registerBool:&Enabled default:YES forKey:@"kEnabled"];
	[preferences registerObject:&CSBStatusLabel default:@"Default" forKey:@"kStatusBarLabel"];
}

%ctor {
    loadPrefs();
    %init(CustomStatusBar);
}