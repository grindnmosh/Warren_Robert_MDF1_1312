//
//  SecondViewController.h
//  Warren_Robert_MDF1_1213_Week2
//
//  Created by Robert Warren on 11/29/13.
//  Copyright (c) 2013 Robert Warren. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SecondViewController : UIViewController <UITableViewDelegate>
{
   //var assignments
    NSMutableArray *topics;
    UITableViewCell *schoolData;
    UITableViewCell *grabData;
    NSString *textVal;
}

@property (weak, nonatomic) IBOutlet UITableView *onChart;

@end