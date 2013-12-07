//
//  ColorPickerPreview.m
//  ColorPicker
//
//  Created by Oscar Del Ben on 8/22/11.
//  Copyright 2011 DibiStore. All rights reserved.
//

#import "ColorPickerPreview.h"

@implementation ColorPickerPreview

@synthesize preview;


- (void)drawRect:(NSRect)dirtyRect
{
    if (!preview)
        return;
    
    [preview drawInRect:dirtyRect fromRect:NSZeroRect operation:NSCompositeSourceOver fraction:1];
    
    NSBezierPath *path = [NSBezierPath bezierPath];
    
    [[NSColor blackColor] set];
    
    float centerAdjust = 3.5f;
    float pickerRectX = dirtyRect.origin.x + centerAdjust;
    float pickerRectY = dirtyRect.origin.y - centerAdjust;
    
    [path moveToPoint:NSMakePoint(pickerRectX - centerAdjust, pickerRectY + dirtyRect.size.width / 2)];
    [path lineToPoint:NSMakePoint(pickerRectX + dirtyRect.size.width - centerAdjust, pickerRectY + dirtyRect.size.height / 2)];
    
    [path moveToPoint:NSMakePoint(pickerRectX + dirtyRect.size.width / 2, pickerRectY + dirtyRect.size.height + centerAdjust)];
    [path lineToPoint:NSMakePoint(pickerRectX + dirtyRect.size.width / 2, pickerRectY + centerAdjust)];
    
    [path stroke];
    
    // Draw border
    //NSBezierPath *path = [NSBezierPath bezierPath];
    
    [path moveToPoint:dirtyRect.origin];
    [path lineToPoint:NSMakePoint(dirtyRect.origin.x, NSMaxY(dirtyRect))];
    [path lineToPoint:NSMakePoint(NSMaxX(dirtyRect), NSMaxY(dirtyRect))];
    [path lineToPoint:NSMakePoint(NSMaxX(dirtyRect), dirtyRect.origin.y)];
    [path closePath];
    
    [[NSColor lightGrayColor] set];
    [path stroke];
}

@end
