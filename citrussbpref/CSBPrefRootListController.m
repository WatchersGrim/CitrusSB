#import <Foundation/Foundation.h>
#import "CSBPrefRootListController.h"

@implementation CSBPrefRootListController

-(void)_returnKeyPressed:(id)arg1 {
   [self.view endEditing:YES];
}

-(void)loadView {
   [super loadView];
   ((UITableView *)[self table]).keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
}

-(void)respring {
	[HBRespringController respring];
}

- (NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [self loadSpecifiersFromPlistName:@"Root" target:self];
	}

	return _specifiers;
}

@end
