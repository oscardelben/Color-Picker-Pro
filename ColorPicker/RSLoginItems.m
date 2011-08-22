//
//  RSLoginItems.m
//  FaceTab
//
//  Created by FIPLAB LIMITED on 2/21/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "RSLoginItems.h"

@implementation RSLoginItems

- (void)addAppAsLoginItem {
	
	// Discussion here: http://cocoatutorial.grapewave.com/2010/02/creating-andor-removing-a-login-item/
	NSString *appPath = [[NSBundle mainBundle] bundlePath];
	CFURLRef url = (__bridge CFURLRef)[NSURL fileURLWithPath:appPath]; 
	LSSharedFileListRef loginItems = LSSharedFileListCreate(NULL, kLSSharedFileListSessionLoginItems, NULL);
	if (loginItems) {
		LSSharedFileListItemRef item = LSSharedFileListInsertItemURL(loginItems, kLSSharedFileListItemLast, 
																	 NULL, NULL, url, NULL, NULL);
		if (item){
			CFRelease(item);
		}
	}	
	CFRelease(loginItems);
}

- (void)deleteAppFromLoginItem {
	
	// Discussion here: http://cocoatutorial.grapewave.com/2010/02/creating-andor-removing-a-login-item/
	NSString * appPath = [[NSBundle mainBundle] bundlePath];
	CFURLRef url = (__bridge CFURLRef)[NSURL fileURLWithPath:appPath]; 	
	LSSharedFileListRef loginItems = LSSharedFileListCreate(NULL, kLSSharedFileListSessionLoginItems, NULL);
	
	if (loginItems) {
		UInt32 seedValue;
		NSArray  *loginItemsArray = (__bridge NSArray *)LSSharedFileListCopySnapshot(loginItems, &seedValue);
		for(int i=0; i<[loginItemsArray count]; i++){
			LSSharedFileListItemRef itemRef = (__bridge LSSharedFileListItemRef)[loginItemsArray
																		objectAtIndex:i];
			if (LSSharedFileListItemResolve(itemRef, 0, (CFURLRef*) &url, NULL) == noErr) {
				NSString * urlPath = [(__bridge NSURL *)url path];
				if ([urlPath compare:appPath] == NSOrderedSame){
					LSSharedFileListItemRemove(loginItems,itemRef);
				}
			}
		}
	}
}

@end
