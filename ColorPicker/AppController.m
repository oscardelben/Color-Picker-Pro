#import "AppController.h"
#import "ColorPickerViewController.h"
#import "RSLoginItems.h"
#import "DDHotKeyCenter.h"
#import "NSColorFormatter.h"
#import "NSScreen+PointConversion.h"

@implementation AppController

@synthesize window;
@synthesize statusItem;
@synthesize statusItemView;
@synthesize view;
@synthesize loginItems;
@synthesize viewController;

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
    self.viewController = [[ColorPickerViewController alloc] initWithNibName:@"ColorPickerView" bundle:nil];
    viewController.appController = self;
    self.view = viewController.view;
    
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
    
    [self updateViews];
    
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
		[self toggleShowWindowFromPoint:[statusItemView getAnchorPoint] forceAnchoring:YES];
	}
    
    [self registerHotKey];
    
    // register for mouse moved events
    [NSEvent addGlobalMonitorForEventsMatchingMask:NSMouseMovedMask handler:^ (NSEvent *event){
        [self updateViews];
    }];
}

- (void)toggleShowWindowFromPoint:(NSPoint)point forceAnchoring:(BOOL)forceAnchoring
{
    [self.window setAttachPoint:point forceAnchoring:forceAnchoring];
    [self.window toggleVisibility];
    
    // Force window to front 
    [NSApp activateIgnoringOtherApps:YES];
}

- (void)toggleShowWindow
{
    [self toggleShowWindowFromPoint:[statusItemView getAnchorPoint] forceAnchoring:NO];
}

- (void)updateViews
{
    NSPoint mouseLocation = [NSEvent mouseLocation];
    
    NSScreen *screen = [NSScreen currentScreenForMouseLocation];
    NSPoint normalizedPoint = [screen flipPoint:[screen convertPointToScreenCoordinates:mouseLocation]];
        
    statusItemView.mouseLocation = normalizedPoint;
    viewController.mouseLocation = normalizedPoint;
    
    [statusItemView setNeedsDisplay:YES];
    [viewController updateView];
}

#pragma mark run at login

- (void)runOnLogin:(NSAlert *)sheet returnCode:(NSInteger)returnCode contextInfo:(void *)contextInfo {
	if (NSAlertOtherReturn == returnCode)	{
		NSLog(@"User did set login item");
		[self.loginItems addAppAsLoginItem];
		[[NSUserDefaults standardUserDefaults] setBool:YES forKey:kUserDefaultsKeyStartAtLogin];
	}
	[self toggleShowWindow];
}

#pragma mark HotKeys

- (void)registerHotKey
{
    DDHotKeyCenter * c = [[DDHotKeyCenter alloc] init];
	DDHotKeyTask task = ^(NSEvent *hkEvent) {
		[viewController captureColor:YES];
        [self toggleShowWindowFromPoint:[statusItemView getAnchorPoint]];
	};
	if (![c registerHotKeyWithKeyCode:35 modifierFlags:(NSCommandKeyMask | NSShiftKeyMask) task:task]) { // cmd shift p
		NSLog(@"Unable to register hotkey");
	} else {
		NSLog(@"Registered hotkey");
	}
}

- (void)unregisterHotKey
{
    DDHotKeyCenter * c = [[DDHotKeyCenter alloc] init];
	[c unregisterHotKeyWithKeyCode:35 modifierFlags:(NSCommandKeyMask | NSShiftKeyMask)]; // control f
	NSLog(@"Unregistered hotkey");
}

#pragma mark -

- (void)copyColorToPasteboard:(NSColor *)color
{
    NSPasteboard *pasteBoard = [NSPasteboard generalPasteboard];
    
    [pasteBoard declareTypes:[NSArray arrayWithObject:NSStringPboardType] owner:nil];
    [pasteBoard setString:[color colorToRGBRepresentation] forType:NSStringPboardType];
    
    // TODO: see preferences to decide the type to copy
}


@end
