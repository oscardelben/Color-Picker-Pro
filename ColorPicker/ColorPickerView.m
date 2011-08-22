//
//  ColorPickerView.m
//  ColorPicker
//
//  Created by Oscar Del Ben on 8/21/11.
//  Copyright 2011 DibiStore. All rights reserved.
//

#import "ColorPickerView.h"
#import "ColorPicker.h"

@implementation ColorPickerView

@synthesize mouseLocation;

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

- (id)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

- (void)drawRect:(NSRect)dirtyRect
{
    if (!mouseLocation.x)
        return;
        
    NSRect pickerRect = NSMakeRect(20, 20, 200, 200);
    NSRect rgbRect    = NSMakeRect(250, 200, 150, 30);
    NSRect hexRect    = NSMakeRect(250, 150, 150, 30);
    
    // picker view
    
    NSImage *pickerImage = [ColorPicker imageForLocation:mouseLocation];
    
    [pickerImage drawInRect:pickerRect fromRect:NSZeroRect operation:NSCompositeSourceOver fraction:1.0];
    
    NSBezierPath *path = [NSBezierPath bezierPath];
    
    [[NSColor blackColor] set];
    
    float pickerRectX = pickerRect.origin.x;
    float pickerRectY = pickerRect.origin.y;
    
    [path moveToPoint:NSMakePoint(pickerRectX, pickerRectY + pickerRect.size.width / 2)];
    [path lineToPoint:NSMakePoint(pickerRectX + pickerRect.size.width, pickerRectY + pickerRect.size.height / 2)];
    
    [path moveToPoint:NSMakePoint(pickerRectX + pickerRect.size.width / 2, pickerRectY + pickerRect.size.height)];
    [path lineToPoint:NSMakePoint(pickerRectX + pickerRect.size.width / 2, pickerRectY)];
    
    [path stroke];
    
    // colors
    
    NSColor *currentColor = [ColorPicker colorAtLocation:mouseLocation];

    float r = [currentColor redComponent] * 0.255 / 1.0;
    float g = [currentColor greenComponent] * 0.255 / 1.0;
    float b = [currentColor blueComponent] * 0.255 / 1.0;
    
    
    NSString *rgb = [NSString stringWithFormat:@"rgb(%@, %@, %@)", 
                     [self floatToStringWithDecimal:r],
                     [self floatToStringWithDecimal:g],
                     [self floatToStringWithDecimal:b]];
    
    [rgb drawInRect:rgbRect withAttributes:nil];
    
    
    NSString *hex = [NSString stringWithFormat:@"#%@%@%@", 
                     [self floatToStringWithHex:r],
                     [self floatToStringWithHex:g],
                     [self floatToStringWithHex:b]];
    
    [hex drawInRect:hexRect withAttributes:nil];
}

@end
