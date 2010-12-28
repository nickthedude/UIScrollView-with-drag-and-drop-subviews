//
//  TestView.m
//  WordDrawer
//
//  Created by Nicholas Iannone on 12/25/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "TestView.h"


@implementation TestView

@synthesize mainView, scrollParent, delegate;

- (id)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code.
		
		self.backgroundColor = [UIColor randomColor];
		//self.frame = CGRectMake(0, 0, 150, 44);
		isInScrollview	= YES;
		hasExitedDrawer = NO;
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code.
}
*/

- (void)dealloc {
    [super dealloc];
	[mainView release];
	[scrollParent release];
}

-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {

	if (isInScrollview == YES) {
		NSLog(@"%f,%f", self.center.x, self.center.y);
		CGPoint newLoc = CGPointZero;
		
		newLoc = [self.mainView convertPoint:[[touches anyObject] locationInView:self.superview] toView:self.superview];
		float newX = newLoc.x + self.superview.frame.origin.x + (self.frame.size.width /2) + [[touches anyObject] locationInView:self].x ;
		float newY = newLoc.y - (((UIScrollView *)self.superview).contentOffset.y *2) ;
		NSLog(@"content offset %f", ((UIScrollView *)self.superview).contentOffset.y);

		self.scrollParent.scrollEnabled = NO;
		NSLog(@"%f,%f", self.center.x, self.center.y);

		newLoc = CGPointMake(newX, newY);
		[self.superview touchesCancelled:touches withEvent:event];																 
		[self removeFromSuperview];
		NSLog(@"%f,%f", self.center.x, self.center.y);

		
		self.center = CGPointMake(newLoc.x, newLoc.y);
		[self.mainView addSubview:self];
		NSLog(@"%f,%f", self.center.x, self.center.y);

		[self.mainView bringSubviewToFront:self];
		isInScrollview = NO;
		
		
			
	}
	else {
		;
	}

}	


-(void) touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
	
	[UIView beginAnimations:@"stalk" context:nil];
	[UIView setAnimationDuration:.001];
	[UIView setAnimationBeginsFromCurrentState:YES];
	
	UITouch *touch = [touches anyObject];
	
	self.center = [touch locationInView: self.superview];

	[UIView commitAnimations];
	if ((self.center.x + (self.frame.size.width / 2)) > 150 && hasExitedDrawer && !self.scrollParent.dragging ) {
		self.scrollParent.scrollEnabled = NO;

		[self.delegate moveItemsDownFromIndex: ((self.center.y + (self.scrollParent.contentOffset.y)) / 44) + 1 ];
		//NSLog(@"%i", ((self.center.y + (self.scrollParent.contentOffset.y *2)) / 44) + 1);
	}
	
	if (self.center.x + (self.frame.size.width / 2) < 150) {
	
		hasExitedDrawer = YES;
		
	}
	
}	

-(void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
	
	if ((self.center.x + (self.frame.size.width / 2)) > 150 && hasExitedDrawer && !self.scrollParent.dragging ) {
		CGPoint newLoc = CGPointZero;

		newLoc = [self.scrollParent convertPoint:[[touches anyObject] locationInView:self.superview] toView:self.superview];
		float newY = newLoc.y + (self.scrollParent.contentOffset.y *2);
		
		[self.scrollParent insertSubview:self atIndex:((self.center.y + (self.scrollParent.contentOffset.y)) / 44) ];
		self.frame = CGRectMake(0, newY, self.frame.size.width, self.frame.size.height);
		isInScrollview = YES;
		hasExitedDrawer = NO;
	}
	[self.delegate reloadScrollView];
	self.scrollParent.scrollEnabled = YES;

}
@end
