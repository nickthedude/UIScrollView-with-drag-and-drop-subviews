//
//  WordDrawerViewController.h
//  WordDrawer
//
//  Created by Nicholas Iannone on 12/25/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TestView.h"
@interface WordDrawerViewController : UIViewController <AdjustingDrawerDelegate> {

	UIScrollView *drawer;
	NSMutableArray *views;
	
}

- (IBAction)reloadScrollView;

@property (nonatomic, retain) 	UIScrollView *drawer;
@property (nonatomic, retain) 	NSMutableArray *views;

@end

