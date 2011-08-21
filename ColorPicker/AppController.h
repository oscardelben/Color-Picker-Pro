#import <Foundation/Foundation.h>
#import "CustomWindow.h"
#import "CustomStatusItem.h"

@class ColorPickerView;

@interface AppController : NSObject <CustomStatusItemDelegate>

@property (retain) CustomWindow *window;
@property (retain) NSStatusItem *statusItem;
@property (retain) CustomStatusItem *statusItemView;
@property (retain) IBOutlet ColorPickerView *view;

- (void)toggleShowWindowFromPoint:(NSPoint)point;

- (void)updateViews;

@end
