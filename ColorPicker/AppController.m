#import "AppController.h"
#import "ColorPickerView.h"

@implementation AppController

@synthesize window;
@synthesize statusItem;
@synthesize statusItemView;
@synthesize view;

- (void)awakeFromNib
{
    // setup window
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
    [self toggleShowWindowFromPoint:[statusItemView getAnchorPoint]];
    
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

@end
