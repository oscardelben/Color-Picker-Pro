//
//  NSColorFormatter.h
//  ColorPicker
//
//  Created by Oscar Del Ben on 8/25/11.
//  Copyright 2011 DibiStore. All rights reserved.
//

#import <AppKit/AppKit.h>

@interface NSColor (Formatter)

/* Returns rgb(255, 255, 255) */
- (NSString*)colorToRGBRepresentation;

/* returns #ff0000 */
- (NSString*)colorToHEXRepresentation;

/* returns ff0000 */
- (NSString*)colorToHEXWithoutHashRepresentation;

/* returns [UIColor colorWithRed:1.0f green:1.0f blue:1.0f alpha:1.0f] */
- (NSString*)colorToUIColorRepresentation;

/* returns [NSColor colorWithCalibratedRed:1.0f green:1.0f blue:1.0f alpha:1.0f]; */
- (NSString*)colorToNSColorRepresentation;

/* returns 30° */
- (NSString*)colorToHueRepresentation;

/* returns 30% */
- (NSString*)colorToSaturationRepresentation;

/* returns 50% */
- (NSString*)colorToBrightnessRepresentation;

/* returns cmyk(255, 255, 255, 0) */
- (NSString*)colorToCMYKRepresentation;

/* return new UIColor(red:1.0f, green:1.0f, blue:1.0f, alpha:1.0f); */
- (NSString *)colorToMonoTouchRepresentation;

@end
