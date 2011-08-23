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

@implementation ColorPickerViewController

@synthesize mouseLocation;
@synthesize colorPickerPreview;
@synthesize rgbText;
@synthesize hexText;
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

#pragma mark Utils

- (NSString *)floatToStringWithDecimal:(float)aFloat
{
    double value = [[NSNumber numberWithFloat:aFloat] doubleValue];
    unsigned int intPart = (unsigned)value;
    unsigned decimalPart = (value * 1000) - (intPart * 1000);
    
    return [NSString stringWithFormat:@"%03u", decimalPart];
}

- (NSString *)floatToStringWithHex:(float)aFloat
{
    double value = [[NSNumber numberWithFloat:aFloat] doubleValue];
    unsigned int intPart = (unsigned)value;
    unsigned decimalPart = (value * 1000) - (intPart * 1000);
    
    return [NSString stringWithFormat:@"%02x", decimalPart];
}

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
    
    float r = [currentColor redComponent] * 0.255 / 1.0;
    float g = [currentColor greenComponent] * 0.255 / 1.0;
    float b = [currentColor blueComponent] * 0.255 / 1.0;
    
    
    NSString *rgb = [NSString stringWithFormat:@"rgb(%@, %@, %@)", 
                     [self floatToStringWithDecimal:r],
                     [self floatToStringWithDecimal:g],
                     [self floatToStringWithDecimal:b]];
    
    [rgbText setStringValue:rgb];
    
    
    NSString *hex = [NSString stringWithFormat:@"#%@%@%@", 
                     [self floatToStringWithHex:r],
                     [self floatToStringWithHex:g],
                     [self floatToStringWithHex:b]];
    
    [hexText setStringValue:hex];
    
    [x setStringValue:[NSString stringWithFormat:@"%.f", mouseLocation.x]];
    [y setStringValue:[NSString stringWithFormat:@"%.f", mouseLocation.y]];
    
    [self updateHistoryView];
}

- (void)captureColor
{
    NSColor *currentColor = [ColorPicker colorAtLocation:mouseLocation];
    [ColorsHistoryController push:currentColor];
    
    updateColorsHistory = YES;
    [self updateView];
}

@end
