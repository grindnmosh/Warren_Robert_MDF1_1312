//
//  FirstViewController.h
//  Warren_Robert_MDF1_Week3
//
//  Created by Robert Warren on 12/3/13.
//  Copyright (c) 2013 Robert Warren. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BusinessClass.h"
#import "Database.h"

@interface FirstViewController : UIViewController
{
    //singleton call
    Database *businesses;
    
    //vars set for cleaner data
    NSMutableArray *businessName;
    NSMutableArray *locations;
    UITableViewCell *bizCell;
    UITableViewCell *grabData;
    NSString *textVal;
}


@property (weak, nonatomic) IBOutlet UITableView *tableView;


-(IBAction)onClick:(id)sender;


@end
