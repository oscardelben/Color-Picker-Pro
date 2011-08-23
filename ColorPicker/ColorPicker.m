//
//  ColorPickerView.m
//  Test
//
//  Created by Oscar Del Ben on 8/20/11.
//  Copyright 2011 DibiStore. All rights reserved.
//

#import "ColorPicker.h"

#define kWidth 20
#define kHeight 20

@implementation ColorPicker

+ (NSImage *)imageForLocation:(NSPoint)mouseLocation
{
    // TODO: check if it works in multiple monitors
    
    NSNumber *screenNumber = [[[NSScreen mainScreen] deviceDescription] objectForKey:@"NSScreenNumber"];
    CGDirectDisplayID displayID = (CGDirectDisplayID) [screenNumber pointerValue];
    
    CGImageRef imageRef = CGDisplayCreateImageForRect(displayID, CGRectMake(mouseLocation.x - kWidth / 2, mouseLocation.y - kHeight / 2, kWidth, kHeight));
    
    NSImage *image = [[NSImage alloc] initWithCGImage:imageRef size:NSMakeSize(kWidth, kHeight)];
    
    CGImageRelease(imageRef);
    
    return image;
}

+ (NSColor *)colorAtLocation:(NSPoint)mouseLocation
{   
    NSNumber *screenNumber = [[[NSScreen mainScreen] deviceDescription] objectForKey:@"NSScreenNumber"];
    CGDirectDisplayID displayID = (CGDirectDisplayID) [screenNumber pointerValue];

    CGImageRef image = CGDisplayCreateImageForRect(displayID, CGRectMake(mouseLocation.x, mouseLocation.y, 1, 1));
    NSBitmapImageRep *bitmap = [[NSBitmapImageRep alloc] initWithCGImage:image];
    
    CGImageRelease(image);

    return [bitmap colorAtX:0 y:0];
}

@end
