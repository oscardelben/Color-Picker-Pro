//
//  NSScreen+PointConversion.h
//  ColorPicker
//
//  Created by Oscar Del Ben on 9/5/11.
//  Copyright 2011 DibiStore. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSScreen (PointConversion)

+ (NSScreen *)currentScreenForMouseLocation;
- (NSPoint)convertPointToScreenCoordinates:(NSPoint)aPoint;
- (NSPoint)flipPoint:(NSPoint)aPoint;

@end
