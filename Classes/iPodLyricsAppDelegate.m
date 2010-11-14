//
//  iPodLyricsAppDelegate.m
//  iPodLyrics
//
//  Created by Roman Efimov on 5/2/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "iPodLyricsAppDelegate.h"
#import "MainViewController.h"

@implementation iPodLyricsAppDelegate


@synthesize window;
@synthesize mainViewController;


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    
	MainViewController *aController = [[MainViewController alloc] initWithNibName:@"MainView" bundle:nil];
	self.mainViewController = aController;
	[aController release];

	
    mainViewController.view.frame = [UIScreen mainScreen].applicationFrame;
	[window addSubview:[mainViewController view]];
    [window makeKeyAndVisible];
	

	
	return YES;
}


- (void)dealloc {
    [mainViewController release];
    [window release];
    [super dealloc];
}

@end
