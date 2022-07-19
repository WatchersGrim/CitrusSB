#import <Foundation/Foundation.h>
#import "CSBPrefRootListController.h"

@implementation CSBPrefRootListController

- (NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [self loadSpecifiersFromPlistName:@"Root" target:self];
	}

	return _specifiers;
}

@end
