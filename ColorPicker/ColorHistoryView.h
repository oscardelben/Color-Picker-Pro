//
//  ColorHistoryView.h
//  ColorPicker
//
//  Created by Oscar Del Ben on 8/22/11.
//  Copyright 2011 DibiStore. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class ColorPickerViewController;

@interface ColorHistoryView : NSView


@property (retain) ColorPickerViewController *viewController;
@property (retain) NSColor *color;

@end
