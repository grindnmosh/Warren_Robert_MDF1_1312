//
//  RegisterViewController.m
//  Warren_Robert_MDF1_1213_Week2
//
//  Created by Robert Warren on 11/29/13.
//  Copyright (c) 2013 Robert Warren. All rights reserved.
//

#import "RegisterViewController.h"
#import "ThirdViewController.h"

@interface RegisterViewController ()

@end

@implementation RegisterViewController

@synthesize minimumDate, userName, userGoal, dateString;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    dataPass = [CustomSingleton singleOBJ];
    //keyboard notifications
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}
//keyboard methods
-(void)keyboardWillShow:(NSNotification*)notification
{
    
}

//keyboard methods
-(void)keyboardWillHide:(NSNotification*)notification
{
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)onClose:(id)sender
{
    //close keyboard on name field
    [userName resignFirstResponder];
    //close keyboard on goal field
    [userGoal resignFirstResponder];
}

//set timezone
+ (void)setDefaultTimeZone:(NSTimeZone *)aTimeZone
{
    [NSTimeZone localTimeZone];
}

-(IBAction) onClick:(id)sender
{
    //save button
    
    date = datePicker.date;
    //format date on unchanged UIDatePicker
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"EEE, MMMM dd, yyyy"];
    if ([userName.text  isEqual: @""])
    {
        //missing info alert
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Missing Information!" message:@"Please Enter Name" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
            
    }
    else if ([userName.text  isEqual: @"Your Name"])
    {
        //missing info alert
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Missing Information!" message:@"Please Enter Name" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        
    }
    else if ([userGoal.text  isEqual: @""])
    {
        //missing info alert
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Missing Information!" message:@"Please Enter Goal" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        
    }
    else if ([userGoal.text  isEqual: @"Your Goal"])
    {
        //missing info alert
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Missing Information!" message:@"Please Enter Goal" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        
    }
    
    else
    {
        //call data from fields
        reqName = userName.text;
        reqGoal = userGoal.text;
        dateString = [dateFormatter stringFromDate:date];

        //singleton data
        dataPass.uniName = [NSString stringWithFormat:@"%@", reqName];
        dataPass.uniGoal = [NSString stringWithFormat:@"%@", reqGoal];
        dataPass.uniDate = [NSString stringWithFormat:@"%@", dateString];
        
        //dismiss view from screen
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}


//records the changes in the UIDatePicker
-(IBAction)onChange:(id)sender
{
    //minimum date
    datePicker.minimumDate = [[ NSDate alloc ] initWithTimeIntervalSinceNow: (NSTimeInterval) 0 ];
    
}

@end
