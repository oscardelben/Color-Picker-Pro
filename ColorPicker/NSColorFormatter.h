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

/* returns [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0] */
- (NSString*)colorToUIColorRepresentation;

/* returns 30° */
- (NSString*)colorToHueRepresentation;

/* returns 30% */
- (NSString*)colorToSaturationRepresentation;

/* returns 50% */
- (NSString*)colorToBrightnessRepresentation;

/* returns cmyk(255, 255, 255, 0) */
- (NSString*)colorToCMYKRepresentation;
@end
