#import "CustomStatusItem.h"
#import "ColorPicker.h"

@implementation CustomStatusItem

@synthesize mouseLocation;
@synthesize delegate;
@synthesize menuBarImage;
@synthesize imageRect;
@synthesize colorRect;

#define kPadding 3.0

- (void)drawRect:(NSRect)dirtyRect
{
    if (!menuBarImage) {
        self.menuBarImage = [NSImage imageNamed:@"ColorPicker_menubar.png"];
        imageRect = NSMakeRect(0, 3, menuBarImage.size.width, menuBarImage.size.height);
        colorRect = NSMakeRect(menuBarImage.size.width + kPadding, 6, 10, 10);
    }
    
    if (mouseLocation.x) 
    {
        [menuBarImage drawInRect:imageRect fromRect:NSZeroRect operation:NSCompositeSourceOver fraction:1.0f];
        
        NSColor *currentColor = [ColorPicker colorAtLocation:mouseLocation];
        
        [currentColor set];
        NSRectFill(colorRect);
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
