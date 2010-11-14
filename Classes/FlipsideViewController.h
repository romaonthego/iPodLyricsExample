//
//  FlipsideViewController.h
//  iPodLyrics
//
//  Created by Roman Efimov on 5/2/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol FlipsideViewControllerDelegate;


@interface FlipsideViewController : UIViewController {
	id <FlipsideViewControllerDelegate> delegate;
}

@property (nonatomic, assign) id <FlipsideViewControllerDelegate> delegate;
- (IBAction)done;
- (IBAction)doejo;

@end


@protocol FlipsideViewControllerDelegate
- (void)flipsideViewControllerDidFinish:(FlipsideViewController *)controller;
@end

