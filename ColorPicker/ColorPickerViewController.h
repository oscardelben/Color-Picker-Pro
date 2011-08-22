//
//  ColorPickerViewController.h
//  ColorPicker
//
//  Created by Oscar Del Ben on 8/22/11.
//  Copyright 2011 DibiStore. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class ColorPickerPreview;

@interface ColorPickerViewController : NSViewController

@property (assign) NSPoint mouseLocation;
@property (retain) IBOutlet ColorPickerPreview *colorPickerPreview;
@property (retain) IBOutlet NSTextField *rgbText;
@property (retain) IBOutlet NSTextField *hexText;

- (void)updateView;

@end
