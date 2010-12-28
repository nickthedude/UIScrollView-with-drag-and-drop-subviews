//
//  WordDrawerViewController.m
//  WordDrawer
//
//  Created by Nicholas Iannone on 12/25/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "WordDrawerViewController.h"
#import "TestView.h"

const CGFloat kScrollObjHeight  = 44;
const CGFloat kScrollObjWidth   = 280.0;

@implementation WordDrawerViewController 

@synthesize drawer, views;


- (void)layoutScrollImages
{
	TestView *view = nil;
    NSArray *subviews = [drawer subviews];
	NSInteger i = 0;
    // reposition all image subviews in a horizontal serial fashion
    CGFloat curYLoc = 0;
    for (view in subviews)
    {
        if ([view isKindOfClass:[TestView class]])
        {
            CGRect frame = view.frame;
            frame.origin = CGPointMake(0, curYLoc);
            view.frame = frame;
			view.tag = 1000 + i;
			i++;
            
            curYLoc += (kScrollObjHeight);
        }
    }
    
    // set the content size so it can be scrollable
    [drawer setContentSize:CGSizeMake(150,([subviews count] * kScrollObjHeight))];
}

- (IBAction)reloadScrollView 
{
	TestView *view = nil;
    NSArray *subviews = [drawer subviews];
	NSInteger i = 0;
    // reposition all image subviews in a horizontal serial fashion
    CGFloat curYLoc = 0;
	[UIView beginAnimations:@"relayoutView" context:nil];
	for (view in subviews)
    {
        if ([view isKindOfClass:[TestView class]])
        {
            CGRect frame = view.frame;
            frame.origin = CGPointMake(0, curYLoc);
            view.frame = frame;
            i++;
			view.tag = 1000 + i;

            curYLoc += (kScrollObjHeight);
        }
    }
	[drawer setContentSize:CGSizeMake(150,(i * kScrollObjHeight))];

	[UIView commitAnimations];
    // set the content size so it can be scrollable
}

-(void) moveItemsDownFromIndex:(NSInteger)index{
	NSLog(@"index being passed: %i", index);
	TestView *view = nil;
    NSArray *subviews = [drawer subviews];
	NSInteger i = 0;
    // reposition all image subviews in a horizontal serial fashion
    CGFloat curYLoc = index * kScrollObjHeight;
	[UIView beginAnimations:@"partSubviews" context:nil];
	for (view in subviews)
    {
        if ([view isKindOfClass:[TestView class]] && view.tag >= (1000 + index) )
        {
            CGRect frame = view.frame;
            frame.origin = CGPointMake(view.frame.origin.x, curYLoc + kScrollObjHeight);
            view.frame = frame;
            i++;
            curYLoc += (kScrollObjHeight);
        }
    }
	[drawer setContentSize:CGSizeMake(150,(i * kScrollObjHeight) + kScrollObjHeight)];

	[UIView commitAnimations];
    // set the content size so it can be scrollable
	
	
	
}
/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	views = [[NSMutableArray alloc] init];
	drawer = [[UIScrollView alloc] initWithFrame:CGRectMake(120, 0, 150, 480)];

	
	for (NSInteger i=0; i<= 80; i++) {
		TestView *test = [[TestView alloc] init];
		
		[views addObject:test];
		[drawer addSubview:test];
		test.frame = CGRectMake(0, 0, 150, 44);
		test.mainView = self.view;
		test.scrollParent = drawer;
		test.delegate = self;
	}
			  
	[self layoutScrollImages];
	[self.view addSubview:drawer];
	
}



/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}

@end
