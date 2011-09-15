//
//  ColorPickerView.m
//  Test
//
//  Created by Oscar Del Ben on 8/20/11.
//  Copyright 2011 DibiStore. All rights reserved.
//

#import "ColorPicker.h"

#define kWidth 28
#define kHeight 28

@implementation ColorPicker

#pragma mark -

+ (NSImage *)imageForLocation:(NSPoint)mouseLocation;
{
    CGRect imageRect = CGRectMake(mouseLocation.x - kWidth / 2, mouseLocation.y - kHeight / 2, kWidth, kHeight);
    
    CGImageRef imageRef = CGWindowListCreateImage(imageRect, kCGWindowListOptionOnScreenOnly, kCGNullWindowID, kCGWindowImageShouldBeOpaque);
        
    NSImage *image = [[NSImage alloc] initWithCGImage:imageRef size:NSMakeSize(kWidth, kHeight)];
    
    CGImageRelease(imageRef);
    
    return image;

}

+ (NSColor *)colorAtLocation:(NSPoint)mouseLocation
{   
    CGRect imageRect = CGRectMake(mouseLocation.x, mouseLocation.y, 1, 1);
    
    CGImageRef imageRef = CGWindowListCreateImage(imageRect, kCGWindowListOptionOnScreenOnly, kCGNullWindowID, kCGWindowImageDefault);
    
    NSBitmapImageRep *bitmap = [[NSBitmapImageRep alloc] initWithCGImage:imageRef];
    
    CGImageRelease(imageRef);

    return [bitmap colorAtX:0 y:0];
}

@end
