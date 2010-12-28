//
//  TestView.h
//  WordDrawer
//
//  Created by Nicholas Iannone on 12/25/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//
#import <UIKit/UIKit.h>
@protocol AdjustingDrawerDelegate

@required

-(void)reloadScrollView;
-(void) moveItemsDownFromIndex:(NSInteger)index;

@end


@interface UIColor(Random)
+(UIColor *)randomColor;
@end


@implementation UIColor(Random)
+(UIColor *)randomColor
{
	CGFloat red =  (CGFloat)random()/(CGFloat)RAND_MAX;
	CGFloat blue = (CGFloat)random()/(CGFloat)RAND_MAX;
	CGFloat green = (CGFloat)random()/(CGFloat)RAND_MAX;
	return [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
}
@end

#import <UIKit/UIKit.h>


@interface TestView : UIView {

	UIView *mainView;
	BOOL isInScrollview;
	UIScrollView *scrollParent;
	id<AdjustingDrawerDelegate> delegate;
	BOOL hasExitedDrawer;
}

@property (nonatomic, retain) UIView *mainView;
@property (nonatomic, retain) UIScrollView *scrollParent;
@property (nonatomic, retain) 	id<AdjustingDrawerDelegate> delegate;

@end

