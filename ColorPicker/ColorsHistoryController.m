//
//  ColorsHistory.m
//  ColorPicker
//
//  Created by Oscar Del Ben on 8/22/11.
//  Copyright 2011 DibiStore. All rights reserved.
//

#import "ColorsHistoryController.h"

@implementation ColorsHistoryController

+ (NSData *)defaultValues
{
    NSMutableArray *colors = [NSArray arrayWithObjects:[NSColor whiteColor], [NSColor whiteColor], [NSColor whiteColor], [NSColor whiteColor], [NSColor whiteColor], nil];
    return [NSKeyedArchiver archivedDataWithRootObject:colors];
}

+ (void)push:(NSColor *)aColor
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    NSData *currentHistoryData = [defaults objectForKey:kUserDefaultsColorsHistory];
    
    NSMutableArray *currentHistory = [NSMutableArray arrayWithArray:[NSKeyedUnarchiver unarchiveObjectWithData:currentHistoryData]];
    
    [currentHistory insertObject:aColor atIndex:0];
    [currentHistory removeLastObject];
    
    [defaults setObject:[NSKeyedArchiver archivedDataWithRootObject:currentHistory] forKey:kUserDefaultsColorsHistory];
    [defaults synchronize];
}

+ (NSColor *)colorAtIndex:(int)index
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    NSData *currentHistoryData = [defaults objectForKey:kUserDefaultsColorsHistory];
    
    NSMutableArray *currentHistory = [NSKeyedUnarchiver unarchiveObjectWithData:currentHistoryData];
    
    return [currentHistory objectAtIndex:index];
}

@end
