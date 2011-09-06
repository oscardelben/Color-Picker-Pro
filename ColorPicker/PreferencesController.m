//
//  PreferencesViewController.m
//  Color Picker
//
//  Created by Oscar Del Ben on 9/6/11.
//  Copyright 2011 DibiStore. All rights reserved.
//

#import "PreferencesController.h"
#import "RSLoginItems.h"
#import "CustomStatusItem.h"

@implementation PreferencesController
@synthesize defaultFormat;
@synthesize openAtLogin;
@synthesize showColorPreview;
@synthesize loginItems;
@synthesize statusItemView;

- (id)init
{
    self = [super initWithWindowNibName:@"PreferencesController"];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

- (void)awakeFromNib
{
    defaultFormat.tag    = kOptionDefaultFormat;
    openAtLogin.tag      = kOptionOpenAtLogin;
    showColorPreview.tag = kOptionShowColorPreview;
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
    [defaultFormat selectItemAtIndex:[userDefaults integerForKey:kUserDefaultsDefaultFormat]];
    openAtLogin.state = [userDefaults boolForKey:kUserDefaultsKeyStartAtLogin];
    showColorPreview.state = [userDefaults boolForKey:kUserDefaultsShowMenuBarPreview];
}

- (IBAction)controllerChanged:(id)sender {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
    switch ([sender tag]) {
        case kOptionDefaultFormat:
            [userDefaults setObject:[NSNumber numberWithLong:[defaultFormat indexOfSelectedItem]] forKey:kUserDefaultsDefaultFormat];
            break;
        case kOptionOpenAtLogin:
            if ([sender state])	{
				[userDefaults setBool:YES forKey:kUserDefaultsKeyStartAtLogin];
				[self.loginItems addAppAsLoginItem];
			}
			else {
				[userDefaults setBool:NO forKey:kUserDefaultsKeyStartAtLogin];
				[self.loginItems deleteAppFromLoginItem];
			}
            break;
        case kOptionShowColorPreview:
            [userDefaults setObject:[NSNumber numberWithBool:[sender state]] forKey:kUserDefaultsDefaultFormat];
            statusItemView.showPreview = [sender state];
            [statusItemView setNeedsDisplay:YES];
            break;
    }
    
    [userDefaults synchronize];
}
@end
