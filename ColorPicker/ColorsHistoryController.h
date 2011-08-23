//
//  ColorsHistory.h
//  ColorPicker
//
//  Created by Oscar Del Ben on 8/22/11.
//  Copyright 2011 DibiStore. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ColorsHistoryController : NSObject

+ (NSData *)defaultValues;
+ (void)push:(NSColor *)aColor;
+ (NSColor *)colorAtIndex:(int)index;

@end
