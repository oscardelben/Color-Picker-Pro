#import <Foundation/Foundation.h>
#import "CustomWindow.h"
#import "CustomStatusItem.h"

@class ColorPickerView;
@class RSLoginItems;
@class ColorPickerViewController;
@class PreferencesController;

@interface AppController : NSObject <CustomStatusItemDelegate>

@property (retain) CustomWindow *window;
@property (retain) NSStatusItem *statusItem;
@property (retain) CustomStatusItem *statusItemView;
@property (retain) ColorPickerViewController *viewController;
@property (retain) NSView *view;
@property (retain) RSLoginItems *loginItems;
@property (retain) PreferencesController *preferencesController;

- (void)toggleShowWindow;
- (void)toggleShowWindowFromPoint:(NSPoint)point forceAnchoring:(BOOL)forceAnchoring;

- (void)updateViews;

- (void)registerHotKey;
- (void)unregisterHotKey;

- (void)copyColorToPasteboard:(NSColor *)color;

- (IBAction)showPreferences:(id)sender;

@end
