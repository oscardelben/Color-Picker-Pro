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
    
    float pickerRectX = dirtyRect.origin.x;
    float pickerRectY = dirtyRect.origin.y;
    
    [path moveToPoint:NSMakePoint(pickerRectX, pickerRectY + dirtyRect.size.width / 2)];
    [path lineToPoint:NSMakePoint(pickerRectX + dirtyRect.size.width, pickerRectY + dirtyRect.size.height / 2)];
    
    [path moveToPoint:NSMakePoint(pickerRectX + dirtyRect.size.width / 2, pickerRectY + dirtyRect.size.height)];
    [path lineToPoint:NSMakePoint(pickerRectX + dirtyRect.size.width / 2, pickerRectY)];
    
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
