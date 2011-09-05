//
//  ColorPickerView.m
//  Test
//
//  Created by Oscar Del Ben on 8/20/11.
//  Copyright 2011 DibiStore. All rights reserved.
//

#import "ColorPicker.h"
#import "NSScreen+PointConversion.h"

#define kWidth 28
#define kHeight 28

@implementation ColorPicker



+ (NSImage *)imageForLocation:(NSPoint)mouseLocation
{
    NSScreen *screen = [NSScreen currentScreenForMouseLocation];

    NSNumber *screenNumber = [[screen deviceDescription] objectForKey:@"NSScreenNumber"];
    CGDirectDisplayID displayID = (CGDirectDisplayID) [screenNumber pointerValue];
    
    CGImageRef imageRef = CGDisplayCreateImageForRect(displayID, CGRectMake(fabs(mouseLocation.x) - kWidth / 2, fabs(mouseLocation.y) - kHeight / 2, kWidth, kHeight));
        
    NSImage *image = [[NSImage alloc] initWithCGImage:imageRef size:NSMakeSize(kWidth, kHeight)];
    
    CGImageRelease(imageRef);
    
    return image;
}

+ (NSColor *)colorAtLocation:(NSPoint)mouseLocation
{   
    NSScreen *screen = [NSScreen currentScreenForMouseLocation];
    
    NSNumber *screenNumber = [[screen deviceDescription] objectForKey:@"NSScreenNumber"];
    CGDirectDisplayID displayID = (CGDirectDisplayID) [screenNumber pointerValue];

    CGImageRef image = CGDisplayCreateImageForRect(displayID, CGRectMake(fabs(mouseLocation.x), fabs(mouseLocation.y), 1, 1));
    NSBitmapImageRep *bitmap = [[NSBitmapImageRep alloc] initWithCGImage:image];
    
    CGImageRelease(image);

    return [bitmap colorAtX:0 y:0];
}

@end
