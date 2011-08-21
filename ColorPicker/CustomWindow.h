#import <Foundation/Foundation.h>

@interface CustomWindow : NSWindow <NSWindowDelegate> {
    NSPoint attachPoint;
}

@property (assign) NSPoint attachPoint;

- (CustomWindow *)initWithView:(NSView *)view;
- (void)toggleVisibility;

@end
