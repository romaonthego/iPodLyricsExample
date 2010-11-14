//
//  MainViewController.h
//  iPodLyrics
//
//  Created by Roman Efimov on 5/2/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <MediaPlayer/MediaPlayer.h>
#import "FlipsideViewController.h"
#import "LoadingView.h"

@interface MainViewController : UIViewController <FlipsideViewControllerDelegate, UIWebViewDelegate> {
	IBOutlet UIWebView *webView;
	LoadingView *loadingView;
	IBOutlet UIView *emptyView;
}

@property (nonatomic, retain) IBOutlet UIWebView *webView;
@property (nonatomic, retain) LoadingView *loadingView;
@property (nonatomic, retain) UIView *emptyView;

- (IBAction)showInfo;
- (IBAction)refreshLyrics;

@end
