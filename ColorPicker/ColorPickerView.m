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
    NSRect pickerRect = NSMakeRect(0, 0, 100, 100);
    
    if (mouseLocation.x) {
        NSImage *pickerImage = [ColorPicker imageWithSize:pickerRect.size forLocation:mouseLocation];
        
        [pickerImage drawInRect:pickerRect fromRect:NSZeroRect operation:NSCompositeSourceOver fraction:1.0];
    }
    
    // draw lines like xscope
    
    
    
    NSBezierPath *path = [NSBezierPath bezierPath];
    
    [[NSColor blackColor] set];
    
    [path moveToPoint:NSMakePoint(0, pickerRect.size.width / 2)];
    [path lineToPoint:NSMakePoint(pickerRect.size.width, pickerRect.size.height / 2)];
    
    [path moveToPoint:NSMakePoint(pickerRect.size.width / 2, pickerRect.size.height)];
    [path lineToPoint:NSMakePoint(pickerRect.size.width / 2, 0)];
    
    [path stroke];
}

@end
