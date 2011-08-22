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

@implementation ColorPickerViewController

@synthesize mouseLocation;
@synthesize colorPickerPreview;
@synthesize rgbText;
@synthesize hexText;

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
}

@end
