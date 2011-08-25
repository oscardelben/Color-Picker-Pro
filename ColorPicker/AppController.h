#import <Foundation/Foundation.h>
#import "CustomWindow.h"
#import "CustomStatusItem.h"

@class ColorPickerView;
@class RSLoginItems;
@class ColorPickerViewController;

@interface AppController : NSObject <CustomStatusItemDelegate>

@property (retain) CustomWindow *window;
@property (retain) NSStatusItem *statusItem;
@property (retain) CustomStatusItem *statusItemView;
@property (retain) ColorPickerViewController *viewController;
@property (retain) NSView *view;
@property (nonatomic, retain) RSLoginItems *loginItems;

- (void)toggleShowWindow;
- (void)toggleShowWindowFromPoint:(NSPoint)point;

- (void)updateViews;

- (void)registerHotKey;
- (void)unregisterHotKey;

- (void)copyColorToPasteboard:(NSColor *)color;

@end
