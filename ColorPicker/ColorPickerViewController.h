//
//  ColorPickerViewController.h
//  ColorPicker
//
//  Created by Oscar Del Ben on 8/22/11.
//  Copyright 2011 DibiStore. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class AppController;
@class ColorPickerPreview;
@class ColorHistoryView;

@interface ColorPickerViewController : NSViewController {
    ColorHistoryView *colorPreview;
}


@property (retain) AppController *appController;

@property (assign) NSPoint mouseLocation;
@property (retain) IBOutlet ColorPickerPreview *colorPickerPreview;
@property (retain) IBOutlet NSTextField *rgbText;
@property (retain) IBOutlet NSTextField *hexText;
@property (retain) IBOutlet NSTextField *x;
@property (retain) IBOutlet NSTextField *y;

@property (retain) IBOutlet ColorHistoryView *colorHistoryView1;
@property (retain) IBOutlet ColorHistoryView *colorHistoryView2;
@property (retain) IBOutlet ColorHistoryView *colorHistoryView3;
@property (retain) IBOutlet ColorHistoryView *colorHistoryView4;
@property (retain) IBOutlet ColorHistoryView *colorHistoryView5;

@property (strong) IBOutlet ColorHistoryView *colorPreview;

@property (assign) BOOL updateColorsHistory;

- (void)updateView;
- (void)captureColor;
- (IBAction)hide:(id)sender;

@end
