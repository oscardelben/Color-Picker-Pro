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

#pragma mark Utils

+ (CGImageRef)getImageRefForScreen:(NSScreen *)aScreen forRect:(CGRect)aRect
{
    NSNumber *screenNumber = [[aScreen deviceDescription] objectForKey:@"NSScreenNumber"];
    CGDirectDisplayID displayID = (CGDirectDisplayID) [screenNumber pointerValue];
    
    return CGDisplayCreateImageForRect(displayID, aRect);
}

+(CGImageRef)getImageRefForRect:(CGRect)aRect
{
    CGImageRef imageRef = [self getImageRefForScreen:[NSScreen currentScreenForMouseLocation] forRect:aRect];
    
    if (imageRef == NULL) {
        NSLog(@"Warning: imageRef returned NULL. DisplayID was probably invalid. Using the default screen as fallback.");
        
        imageRef = [self getImageRefForScreen:[NSScreen mainScreen] forRect:aRect];
        
        // Check if NULL again
        if (imageRef == NULL) {
            NSLog(@"Warning: imageRef NULL after using the default monitor. Returning");
            return nil;
        }
    }
    
    return imageRef;
}


#pragma mark -

+ (NSImage *)imageForLocation:(NSPoint)mouseLocation
{
    CGRect imageRect = CGRectMake(fabs(mouseLocation.x) - kWidth / 2, fabs(mouseLocation.y) - kHeight / 2, kWidth, kHeight);
    
    CGImageRef imageRef = [self getImageRefForRect:imageRect];
        
    NSImage *image = [[NSImage alloc] initWithCGImage:imageRef size:NSMakeSize(kWidth, kHeight)];
    
    CGImageRelease(imageRef);
    
    return image;

}

+ (NSColor *)colorAtLocation:(NSPoint)mouseLocation
{   
    CGRect imageRect = CGRectMake(fabs(mouseLocation.x), fabs(mouseLocation.y), 1, 1);
    
    CGImageRef imageRef = [self getImageRefForRect:imageRect];
    
    NSBitmapImageRep *bitmap = [[NSBitmapImageRep alloc] initWithCGImage:imageRef];
    
    CGImageRelease(imageRef);

    return [bitmap colorAtX:0 y:0];
}

@end
