#import <Foundation/Foundation.h>

@protocol CustomStatusItemDelegate
- (void)toggleShowWindowFromPoint:(NSPoint)point forceAnchoring:(BOOL)forceAnchoring;
@end

@interface CustomStatusItem : NSView

@property (assign) NSPoint mouseLocation;
@property (retain) id <CustomStatusItemDelegate> delegate;
@property (retain) NSImage *menuBarImage;
@property (assign) NSRect imageRect;
@property (assign) NSRect colorRect;
@property (assign) BOOL showPreview;


- (NSPoint)getAnchorPoint;

@end
