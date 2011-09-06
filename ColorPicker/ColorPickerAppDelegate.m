//
//  ColorPickerAppDelegate.m
//  ColorPicker
//
//  Created by Oscar Del Ben on 8/20/11.
//  Copyright 2011 DibiStore. All rights reserved.
//

#import "ColorPickerAppDelegate.h"
#import "ColorsHistoryController.h"

@implementation ColorPickerAppDelegate

@synthesize window = _window;

+ (void)initialize
{
    NSUserDefaults *defs = [NSUserDefaults standardUserDefaults];
	NSDictionary *defaults = [NSDictionary dictionaryWithObjectsAndKeys:
							  [NSNumber numberWithBool:NO], kUserDefaultsKeyStartAtLogin,
                              [ColorsHistoryController defaultValues], kUserDefaultsColorsHistory,
                              [NSNumber numberWithInt:kFormatHEX], kUserDefaultsDefaultFormat,
                              [NSNumber numberWithBool:YES], kUserDefaultsShowMenuBarPreview,
                              nil];
    [defs registerDefaults:defaults];
	[defs synchronize];
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
    NSLog(@"application did launch");
}

@end
