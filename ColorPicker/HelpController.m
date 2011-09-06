//
//  HelpController.m
//  Color Picker
//
//  Created by Oscar Del Ben on 9/6/11.
//  Copyright 2011 DibiStore. All rights reserved.
//

#import "HelpController.h"

@implementation HelpController
@synthesize instructions;

- (id)init
{
    self = [super initWithWindowNibName:@"HelpController"];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

- (void)awakeFromNib
{
    [instructions setStringValue:kInstructions];
}

@end
