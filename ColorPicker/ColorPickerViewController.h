//
//  ColorPickerViewController.h
//  ColorPicker
//
//  Created by Oscar Del Ben on 8/22/11.
//  Copyright 2011 DibiStore. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class ColorPickerPreview;
@class ColorHistoryView;

@interface ColorPickerViewController : NSViewController

@property (assign) NSPoint mouseLocation;
@property (retain) IBOutlet ColorPickerPreview *colorPickerPreview;
@property (retain) IBOutlet NSTextField *rgbText;
@property (retain) IBOutlet NSTextField *hexText;

@property (retain) IBOutlet ColorHistoryView *colorHistoryView1;
@property (retain) IBOutlet ColorHistoryView *colorHistoryView2;
@property (retain) IBOutlet ColorHistoryView *colorHistoryView3;
@property (retain) IBOutlet ColorHistoryView *colorHistoryView4;
@property (retain) IBOutlet ColorHistoryView *colorHistoryView5;

@property (assign) BOOL updateColorsHistory;

- (void)updateView;
- (void)captureColor;

@end
