//
//  ViewController.h
//  Warren_Robert_MDF1_1312_Week1
//
//  Created by Robert Warren on 11/26/13.
//  Copyright (c) 2013 Robert Warren. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Gift1View.h"

@interface ViewController : UIViewController <UITableViewDelegate>
{
    Gift1View *craptastic;
    IBOutlet UITableView *charted;
    NSMutableArray *santaSack;
    NSMutableArray *tagObj;
    int tag;
    int grab;
}

-(IBAction)onClick:(id)sender;

-(IBAction)onTap:(id)sender;


@end
