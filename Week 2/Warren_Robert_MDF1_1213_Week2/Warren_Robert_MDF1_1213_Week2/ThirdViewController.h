//
//  ThirdViewController.h
//  Warren_Robert_MDF1_1213_Week2
//
//  Created by Robert Warren on 11/29/13.
//  Copyright (c) 2013 Robert Warren. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RegisterViewController.h"
#import "CustomSingleton.h"

@interface ThirdViewController : UIViewController
{
    //singleton Object
    CustomSingleton *dataPass;
    
    //var assignments
    NSString *savedName;
    NSString *saveGoal;
    NSString *saveDate;
    NSString *nameSake;
    NSString *forGoals;
    NSString *datingIt;

}
//properties to assign data on return to viewer
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *goalLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;

@end
