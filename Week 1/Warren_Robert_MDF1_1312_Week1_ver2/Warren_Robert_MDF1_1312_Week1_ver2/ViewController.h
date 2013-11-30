//
//  ViewController.h
//  Warren_Robert_MDF1_1312_Week1_ver2
//
//  Created by Robert Warren on 11/28/13.
//  Copyright (c) 2013 Robert Warren. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Gift1View.h"

@interface ViewController : UIViewController <UITableViewDelegate>
{
    //variables for main viewcontroller
    Gift1View *grabIt;
    Gift1View *craptastic;
    NSMutableArray *santaSack;
    NSMutableArray *santaD1;
    NSMutableArray *santaD2;
    NSString *textFieldVal;
    IBOutlet UITableView *charted;
}

-(IBAction)onClick:(id)sender;



@end
