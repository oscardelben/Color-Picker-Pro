#import "CustomStatusItem.h"
#import "ColorPicker.h"

@implementation CustomStatusItem

@synthesize mouseLocation;
@synthesize delegate;
@synthesize freeMemory;

- (void)drawRect:(NSRect)dirtyRect
{
    if (mouseLocation.x) 
    {
        NSColor *currentColor = [ColorPicker colorAtLocation:mouseLocation];
        
        [currentColor set];
        NSRectFill(dirtyRect);
    }
}

#pragma mark toggleWindow

- (NSPoint)getAnchorPoint
{	
	NSRect frame = [[self window] frame];
	NSRect screen = [[NSScreen mainScreen] frame];
	NSPoint point = NSMakePoint(NSMidX(frame), screen.size.height - [[NSStatusBar systemStatusBar] thickness]);
    
	return point;
}

- (void)toggleShowWindow
{
    if ([(NSObject *)delegate respondsToSelector:@selector(toggleShowWindowFromPoint:forceAnchoring:)]) 
    {
        [delegate toggleShowWindowFromPoint:[self getAnchorPoint] forceAnchoring:NO];
    }
}

#pragma mark Events

// The icon was clicked, we toggle the window

- (void)mouseDown:(NSEvent *)event {
    [self toggleShowWindow];
}

@end
