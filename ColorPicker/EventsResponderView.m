//
//  EventsResponderView.m
//  Color Picker Pro
//
//  Created by Oscar Del Ben on 9/12/11.
//  Copyright (c) 2011 DibiStore. All rights reserved.
//

#import "EventsResponderView.h"
#import "AppController.h"

#define kEscKeyCode 53
#define kLeftArrowKeyCode 123
#define kRightArrowKeyCode 124
#define kDownArrowKeyCode 125
#define kUpArrowKeyCode 126

@implementation EventsResponderView

@synthesize appController;

// I don't really like to have this here. In a perfect world I would have a global hotkey, but I don't want to mess up with Quartz for that

- (BOOL)acceptsFirstResponder
{
    return YES;
}

- (void)keyDown:(NSEvent *)theEvent
{
    switch ([theEvent keyCode]) {
        case kEscKeyCode:
            [appController performSelector:@selector(toggleShowWindow)];
            break;
        case kLeftArrowKeyCode:
            [appController performSelector:@selector(moveLeft)];
            break;
        case kRightArrowKeyCode:
            [appController performSelector:@selector(moveRight)];
            break;
        case kDownArrowKeyCode:
            [appController performSelector:@selector(moveDown)];
            break;
        case kUpArrowKeyCode:
            [appController performSelector:@selector(moveUp)];
            break;
    }
   
}

@end
