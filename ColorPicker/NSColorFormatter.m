//
//  NSColorFormatter.m
//  ColorPicker
//
//  Created by Oscar Del Ben on 8/25/11.
//  Copyright 2011 DibiStore. All rights reserved.
//

#import "NSColorFormatter.h"

@implementation NSColor (Formatter)

#pragma mark Utils

- (unsigned)decimalPart:(float)aFloat precision:(int)precision
{
    double value = [[NSNumber numberWithFloat:aFloat] doubleValue];
    unsigned int intPart = (unsigned)value;
    unsigned decimalPart = (value * pow(10, precision)) - (intPart * pow(10, precision));
    
    return decimalPart;
}

- (NSString *)floatToStringWithDecimal:(float)aFloat
{
    
    return [NSString stringWithFormat:@"%03u", [self decimalPart:aFloat precision:3]];
}

- (NSString *)floatToStringWithHex:(float)aFloat
{
    
    return [NSString stringWithFormat:@"%02x", [self decimalPart:aFloat  precision:3]];
}

#pragma mark Methods

/* Returns rgb(255, 255, 255) */

- (NSString*)colorToRGBRepresentation
{
    float r = [self redComponent] * 0.255 / 1.0;
    float g = [self greenComponent] * 0.255 / 1.0;
    float b = [self blueComponent] * 0.255 / 1.0;
    
    
    NSString *rgb = [NSString stringWithFormat:@"rgb(%@, %@, %@)", 
                     [self floatToStringWithDecimal:r],
                     [self floatToStringWithDecimal:g],
                     [self floatToStringWithDecimal:b]];
    
    return rgb;
}

/* returns #ff0000 */

- (NSString*)colorToHEXRepresentation
{
    float r = [self redComponent] * 0.255 / 1.0;
    float g = [self greenComponent] * 0.255 / 1.0;
    float b = [self blueComponent] * 0.255 / 1.0;
    
    NSString *hex = [NSString stringWithFormat:@"#%@%@%@", 
                     [self floatToStringWithHex:r],
                     [self floatToStringWithHex:g],
                     [self floatToStringWithHex:b]];
    
    return hex;
}

- (NSString*)colorToHueRepresentation
{
    // 0.0 : 
    //0.66666666 : x = 1.0 : 360
    //240
    float h = [self hueComponent];
    
    return [NSString stringWithFormat:@"%i°", (int)(h * 360)];
}

- (NSString*)colorToSaturationRepresentation
{
    unsigned decimalPart = [self decimalPart:[self saturationComponent] precision:2];
    return [NSString stringWithFormat:@"%02u%%", decimalPart];
}

- (NSString*)colorToBrightnessRepresentation
{
    unsigned decimalPart = [self decimalPart:[self brightnessComponent] precision:2];
    return [NSString stringWithFormat:@"%02u%%", decimalPart];
}


@end
