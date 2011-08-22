#import "AppController.h"
#import "ColorPickerView.h"
#import "RSLoginItems.h"

@implementation AppController

@synthesize window;
@synthesize statusItem;
@synthesize statusItemView;
@synthesize view;
@synthesize loginItems;

- (void)awakeFromNib
{
    self.loginItems = [[RSLoginItems alloc] init];
    
    // Count app runs
	NSUserDefaults *defs = [NSUserDefaults standardUserDefaults];
	int timesRun = (int)[defs integerForKey:kUserDefaultsKeyTimesRun];
	if (!timesRun)
		timesRun = 1;
	else
		timesRun++;
	[defs setInteger:timesRun forKey:kUserDefaultsKeyTimesRun]; 	
	[defs synchronize];
	NSLog(@"This app has been run %d times", timesRun);
    
    // setup window
    self.view = [[ColorPickerView alloc] initWithFrame:NSMakeRect(0, 0, 500, 300)];
    
    self.window = [[CustomWindow alloc] initWithView:self.view];
    [window setCollectionBehavior:NSWindowCollectionBehaviorCanJoinAllSpaces];
    
    // setup status bar
    
    float width = 50.0; // some random width, we'll change it programmatically
    float height = [[NSStatusBar systemStatusBar] thickness];
    NSRect statusItemFrame = NSMakeRect(0, 0, width, height);
    
    self.statusItem = [[NSStatusBar systemStatusBar] statusItemWithLength:NSVariableStatusItemLength];
    
    self.statusItemView = [[CustomStatusItem alloc] initWithFrame:statusItemFrame];
    [statusItemView setDelegate:self];
    
    [statusItem setView:self.statusItemView];
    
    // Show window
    if (timesRun == 1)
    {
		NSBeginAlertSheet(kAlertTitleStartupItem,
						  @"No", nil, @"Yes",
						  nil, self,                   
						  @selector(runOnLogin:returnCode:contextInfo:),
						  nil, nil,                 
						  kAlertTextStartupItem,
						  nil);		
	}	
	else 
    {
		[self toggleShowWindowFromPoint:[statusItemView getAnchorPoint]];
	}
    
    // register for mouse moved events
    [NSEvent addGlobalMonitorForEventsMatchingMask:NSMouseMovedMask handler:^ (NSEvent *event){
        [self updateViews];
    }];
}

- (void)toggleShowWindowFromPoint:(NSPoint)point
{
    [self.window setAttachPoint:point];
    [self.window toggleVisibility];
    
    // Force window to front 
    [NSApp activateIgnoringOtherApps:YES];
}

- (void)updateViews
{
    NSPoint mouseLocation = [NSEvent mouseLocation];
    
    statusItemView.mouseLocation = mouseLocation;
    view.mouseLocation = mouseLocation;
    
    [statusItemView setNeedsDisplay:YES];
    [view setNeedsDisplay:YES];
}

#pragma mark run at login

- (void)runOnLogin:(NSAlert *)sheet returnCode:(NSInteger)returnCode contextInfo:(void *)contextInfo {
	if (NSAlertOtherReturn == returnCode)	{
		NSLog(@"User did set login item");
		[self.loginItems addAppAsLoginItem];
		[[NSUserDefaults standardUserDefaults] setBool:YES forKey:kUserDefaultsKeyStartAtLogin];
	}
	[self toggleShowWindowFromPoint:[statusItemView getAnchorPoint]];
}

@end
