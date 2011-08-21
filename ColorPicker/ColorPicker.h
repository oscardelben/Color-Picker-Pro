//
//  ColorPickerView.h
//  Test
//
//  Created by Oscar Del Ben on 8/20/11.
//  Copyright 2011 DibiStore. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface ColorPicker : NSObject

+ (NSImage *)imageWithSize:(NSSize)theSize forLocation:(NSPoint)mouseLocation;
+ (NSColor *)colorAtLocation:(NSPoint)mouseLocation;

@end
