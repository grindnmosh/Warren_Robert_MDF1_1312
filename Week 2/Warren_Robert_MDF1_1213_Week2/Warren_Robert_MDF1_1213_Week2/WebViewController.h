//
//  WebViewController.h
//  Warren_Robert_MDF1_1213_Week2
//
//  Created by Robert Warren on 12/1/13.
//  Copyright (c) 2013 Robert Warren. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OptionsViewController.h"

@interface WebViewController : UIViewController <UIWebViewDelegate>
//grab url property
@property (strong, nonatomic)  NSString *goGoUrl;
@end
