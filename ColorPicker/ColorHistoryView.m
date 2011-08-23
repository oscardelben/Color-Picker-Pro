//
//  ColorHistoryView.m
//  ColorPicker
//
//  Created by Oscar Del Ben on 8/22/11.
//  Copyright 2011 DibiStore. All rights reserved.
//

#import "ColorHistoryView.h"

@implementation ColorHistoryView

@synthesize color;

- (void)drawRect:(NSRect)dirtyRect
{
    if (!color)
        return;

    [color set];
    NSRectFill(dirtyRect);
}

@end
