#import "CSBPrefRootListController.h"
#import <spawn.h>

@implementation CSBPrefRootListController

- (NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [self loadSpecifiersFromPlistName:@"Root" target:self];
	}

	return _specifiers;
}

-(void)_returnKeyPressed:(id)arg1 {
	 
	[self.view endEditing:YES];
}

-(void)loadView {

   [super loadView];

   ((UITableView *)[self table]).keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
}


- (void)respring {

    pid_t pid;
    const char *args[] = {"killall", "backboardd", NULL};
    posix_spawn(&pid, "/usr/bin/killall", NULL, NULL, (char* const*)args, NULL);

}

- (void)resetPreferences {

	// Create Alert
	UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"CitrusSB"
		message:@"Do you really want to reset your preferences?"
		preferredStyle:UIAlertControllerStyleActionSheet];

	// Create the action and give it something to do
	UIAlertAction *confirmAction = [UIAlertAction actionWithTitle:@"Confirm" style: UIAlertActionStyleDestructive 
		handler: ^(UIAlertAction * action) {
			
			[[NSUserDefaults standardUserDefaults] removePersistentDomainForName:@"com.watchersgrim.citrussb"];

			[self respring];
		}];

	UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style: UIAlertActionStyleCancel handler: nil];

	// Add Actions to the Alert 		
	[alert addAction:confirmAction];
	[alert addAction:cancelAction];

	[self presentViewController:alert animated:YES completion:nil];
}

- (void)github {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://github.com/WatchersGrim/CitrusSB"] options:@{} completionHandler:nil];
}
@end
