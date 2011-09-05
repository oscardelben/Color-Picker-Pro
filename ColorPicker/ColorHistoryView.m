//
//  ColorHistoryView.m
//  ColorPicker
//
//  Created by Oscar Del Ben on 8/22/11.
//  Copyright 2011 DibiStore. All rights reserved.
//

#import "ColorHistoryView.h"
#import "ColorPickerViewController.h"

@implementation ColorHistoryView

@synthesize viewController;
@synthesize color;

- (void)drawRect:(NSRect)dirtyRect
{
    
    if (!color)
        color = [NSColor whiteColor];
    
    [color set];
    
    NSRectFill(dirtyRect);
    
    NSBezierPath *path = [NSBezierPath bezierPath];
    
    [path moveToPoint:dirtyRect.origin];
    [path lineToPoint:NSMakePoint(dirtyRect.origin.x, NSMaxY(dirtyRect))];
    [path lineToPoint:NSMakePoint(NSMaxX(dirtyRect), NSMaxY(dirtyRect))];
    [path lineToPoint:NSMakePoint(NSMaxX(dirtyRect), dirtyRect.origin.y)];
    [path closePath];
    
    [[NSColor lightGrayColor] set];
    [path stroke];
}

- (void)mouseDown:(NSEvent *)theEvent
{
    [viewController captureColor:NO];
}

@end
