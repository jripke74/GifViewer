//
//  DetailViewController.h
//  GifViewer
//
//  Created by Jeff Ripke on 8/7/17.
//  Copyright © 2017 Jeff Ripke. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Giphy;

@interface DetailViewController : UIViewController

@property (strong, nonatomic) Giphy *giphy;
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end
