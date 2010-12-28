//
//  WordDrawerAppDelegate.h
//  WordDrawer
//
//  Created by Nicholas Iannone on 12/25/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WordDrawerViewController;

@interface WordDrawerAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    WordDrawerViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet WordDrawerViewController *viewController;

@end

