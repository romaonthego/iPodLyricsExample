//
//  MainViewController.m
//  iPodLyrics
//
//  Created by Roman Efimov on 5/2/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "MainViewController.h"
#import "LoadingView.h"

@implementation MainViewController

@synthesize webView, loadingView, emptyView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}

- (IBAction)refreshLyrics {
	[emptyView setHidden:YES];
	MPMediaItem *media = [[MPMusicPlayerController iPodMusicPlayer] nowPlayingItem];
	
	NSString *artist = [media valueForProperty:MPMediaItemPropertyArtist];
	NSString *song = [media valueForProperty:MPMediaItemPropertyTitle];
	NSString *urlAddress = [[NSString alloc] initWithFormat:@"http://lyrics.wikia.com/%@:%@", artist, song];
	NSString* escapedUrl = [urlAddress  
							stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]; 
	
	if (([[MPMusicPlayerController iPodMusicPlayer] playbackState] != MPMusicPlaybackStatePlaying) &&
	   ([[MPMusicPlayerController iPodMusicPlayer] playbackState] != MPMusicPlaybackStatePaused)){
		[emptyView setHidden:NO];
		[webView setHidden:YES];
		return;
	}
	
	//Create a URL object.
	NSURL *url = [NSURL URLWithString:escapedUrl];
	
	//URL Requst Object
	NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
	
	//Load the request in the UIWebView.
	[webView loadRequest:requestObj];
	
	loadingView = [LoadingView loadingViewInView:self.view];
	
	[[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
	if (navigationType == UIWebViewNavigationTypeLinkClicked) {
		[[UIApplication sharedApplication] openURL:[request URL]];
		return NO;
	}
	
	return YES;
}


- (void)webViewDidFinishLoad:(UIWebView *)webView {    
	[loadingView removeView];
	[[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
}


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	[self refreshLyrics];

	[super viewDidLoad];
}



- (void)flipsideViewControllerDidFinish:(FlipsideViewController *)controller {
    
	[self dismissModalViewControllerAnimated:YES];
}


- (IBAction)showInfo {    
	
	FlipsideViewController *controller = [[FlipsideViewController alloc] initWithNibName:@"FlipsideView" bundle:nil];
	controller.delegate = self;
	
	controller.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
	[self presentModalViewController:controller animated:YES];
	
	[controller release];
}


- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc. that aren't in use.
}


- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end
