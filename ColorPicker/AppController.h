#import <Foundation/Foundation.h>
#import "CustomWindow.h"
#import "CustomStatusItem.h"

@class ColorPickerView;
@class RSLoginItems;
@class ColorPickerViewController;
@class PreferencesController;
@class HelpController;

@interface AppController : NSObject <CustomStatusItemDelegate>

@property (retain) CustomWindow *window;
@property (retain) NSStatusItem *statusItem;
@property (retain) CustomStatusItem *statusItemView;
@property (retain) ColorPickerViewController *viewController;
@property (retain) NSView *view;
@property (retain) RSLoginItems *loginItems;
@property (retain) PreferencesController *preferencesController;
@property (retain) HelpController *helpController;
@property (retain) NSTimer *updateTimer;
@property (assign) BOOL updateMouseLocation;
@property (assign) NSPoint mouseLocation;

- (void)toggleShowWindow;
- (void)toggleShowWindowFromPoint:(NSPoint)point forceAnchoring:(BOOL)forceAnchoring;

- (void)updateViews;

- (void)registerHotKey;
- (void)unregisterHotKey;

- (void)copyColorToPasteboard:(NSColor *)color;

- (IBAction)showPreferences:(id)sender;
- (IBAction)showHelp:(id)sender;

- (void)moveLeft;
- (void)moveRight;
- (void)moveDown;
- (void)moveUp;

@end
