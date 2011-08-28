//
//  ColorPickerViewController.m
//  ColorPicker
//
//  Created by Oscar Del Ben on 8/22/11.
//  Copyright 2011 DibiStore. All rights reserved.
//

#import "ColorPickerViewController.h"
#import "ColorPicker.h"
#import "ColorPickerPreview.h"
#import "ColorHistoryView.h"
#import "ColorsHistoryController.h"
#import "AppController.h"
#import "NSColorFormatter.h"

@implementation ColorPickerViewController
@synthesize appController;
@synthesize mouseLocation;
@synthesize colorPickerPreview;
@synthesize rgbText;
@synthesize hexText;
@synthesize hueText;
@synthesize saturationText;
@synthesize brightnessText;
@synthesize colorPreview;
@synthesize updateColorsHistory;
@synthesize colorHistoryView1, colorHistoryView2, colorHistoryView3, colorHistoryView4, colorHistoryView5;
@synthesize x, y;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.updateColorsHistory = YES;
    }
    
    return self;
}

- (void)awakeFromNib
{
    colorHistoryView1.viewController = self;
    colorHistoryView2.viewController = self;
    colorHistoryView3.viewController = self;
    colorHistoryView4.viewController = self;
    colorHistoryView5.viewController = self;
}

#pragma mark Utils

- (void)updateHistoryView
{
    if (!updateColorsHistory)
        return;
    
    colorHistoryView1.color = [ColorsHistoryController colorAtIndex:0];
    colorHistoryView2.color = [ColorsHistoryController colorAtIndex:1];
    colorHistoryView3.color = [ColorsHistoryController colorAtIndex:2];
    colorHistoryView4.color = [ColorsHistoryController colorAtIndex:3];
    colorHistoryView5.color = [ColorsHistoryController colorAtIndex:4];
    
    [colorHistoryView1 setNeedsDisplay:YES];
    [colorHistoryView2 setNeedsDisplay:YES];
    [colorHistoryView3 setNeedsDisplay:YES];
    [colorHistoryView4 setNeedsDisplay:YES];
    [colorHistoryView5 setNeedsDisplay:YES];
    
    updateColorsHistory = NO;
}

#pragma mark -

- (void)updateView
{
    if (!mouseLocation.x)
        return;
    
    // picker view
    
    NSImage *pickerImage = [ColorPicker imageForLocation:mouseLocation];
    
    colorPickerPreview.preview = pickerImage;
    [colorPickerPreview setNeedsDisplay:YES];
    
    // colors
    
    NSColor *currentColor = [ColorPicker colorAtLocation:mouseLocation];
  
    colorPreview.color = currentColor;
    [colorPreview setNeedsDisplay:YES];
    
    [rgbText setStringValue:[currentColor colorToRGBRepresentation]];
    [hexText setStringValue:[currentColor colorToHEXRepresentation]];

    [hueText setStringValue:[currentColor colorToHueRepresentation]];
    [saturationText setStringValue:[currentColor colorToSaturationRepresentation]];
    [brightnessText setStringValue:[currentColor colorToBrightnessRepresentation]];
    
    [x setStringValue:[NSString stringWithFormat:@"%.f", mouseLocation.x]];
    [y setStringValue:[NSString stringWithFormat:@"%.f", mouseLocation.y]];
    
    [self updateHistoryView];
}

- (void)captureColor:(BOOL)saveToHistory
{
    NSColor *currentColor = [ColorPicker colorAtLocation:mouseLocation];

    [appController copyColorToPasteboard:currentColor];
    
    if (saveToHistory) {
        [ColorsHistoryController push:currentColor];
        
        updateColorsHistory = YES;
        [self updateView];
    }
}

- (IBAction)hide:(id)sender {
    [appController toggleShowWindow];
}

@end
