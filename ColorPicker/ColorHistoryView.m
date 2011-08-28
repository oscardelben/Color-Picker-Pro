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
        return;

    [color set];
    NSRectFill(dirtyRect);
}

- (void)mouseDown:(NSEvent *)theEvent
{
    [viewController captureColor:NO];
}

@end
