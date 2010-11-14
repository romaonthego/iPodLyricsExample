//
//  iPodLyricsAppDelegate.h
//  iPodLyrics
//
//  Created by Roman Efimov on 5/2/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>

@class MainViewController;

@interface iPodLyricsAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    MainViewController *mainViewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) MainViewController *mainViewController;

@end

