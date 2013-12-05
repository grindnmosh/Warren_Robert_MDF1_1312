//
//  RegisterViewController.h
//  Warren_Robert_MDF1_1213_Week2
//
//  Created by Robert Warren on 11/29/13.
//  Copyright (c) 2013 Robert Warren. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomSingleton.h"

@interface RegisterViewController : UIViewController <UITextFieldDelegate>
{
    //singleton Object
    CustomSingleton *dataPass;
    
    //var assignments
    NSString *dated;
    NSString *reqName;
    NSString *reqGoal;
    NSString *dateString;
    NSString *name;
    NSString *goalie;
    NSDate *date;
    
    //set outlets
    IBOutlet UIButton *saveMe;
    IBOutlet UITextField *userName;
    IBOutlet UITextField *userGoal;
    IBOutlet UIDatePicker *datePicker;
}


//default timezone
+(void)setDefaultTimeZone:(NSTimeZone *)aTimeZone;

//minimum date property
@property (nonatomic, retain) NSDate *minimumDate;

@property (nonatomic, retain) UITextField *userName;
@property (nonatomic, retain) UITextField *userGoal;
@property (nonatomic, retain) NSString *dateString;

@end
