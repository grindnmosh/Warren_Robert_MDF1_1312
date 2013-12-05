//
//  ThirdViewController.m
//  Warren_Robert_MDF1_1213_Week2
//
//  Created by Robert Warren on 11/29/13.
//  Copyright (c) 2013 Robert Warren. All rights reserved.
//

#import "ThirdViewController.h"
#import "RegisterViewController.h"

@interface ThirdViewController ()

@end

@implementation ThirdViewController

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
    //check for saved data on load
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    //load data if it is there
    if (defaults != nil);
    {
        savedName = [defaults objectForKey:@"filedName"];
        saveGoal = [defaults objectForKey:@"filedGoal"];
        saveDate = [defaults objectForKey:@"filedDate"];
        //check if datais there and if it is load it into fields
        if (savedName != nil)
        {
            _nameLabel.text = savedName;
            _goalLabel.text = saveGoal;
            _dateLabel.text = saveDate;
        }
        //check if datais there and if it isn't load default data
        else
        {
            _nameLabel.text = @"Visitor";
            _goalLabel.text = @"Your Long Term Goal At A Glance";
            _dateLabel.text = @"The Date To Achieve By";
        }
        
    }

    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)viewDidAppear:(BOOL)animated
{
    //grabbed data from RegisterViewController
    NSString *uniName = [dataPass uniName];
    NSString *uniGoal = [dataPass uniGoal];
    NSString *uniDate = [dataPass uniDate];
    
    savedName = [NSString stringWithFormat:@"%@", uniName];
    saveGoal = [NSString stringWithFormat:@"%@", uniGoal];
    saveDate = [NSString stringWithFormat:@"%@", uniDate];
    
    
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];

    if (uniName == nil) {
        if (defaults != nil);
        {
            savedName = [defaults objectForKey:@"filedName"];
            saveGoal = [defaults objectForKey:@"filedGoal"];
            saveDate = [defaults objectForKey:@"filedDate"];
            //check if datais there and if it is load it into fields
            if (savedName != nil)
            {
                _nameLabel.text = savedName;
                _goalLabel.text = saveGoal;
                _dateLabel.text = saveDate;
            }
            //check if datais there and if it isn't load default data
            else
            {
                _nameLabel.text = @"Visitor";
                _goalLabel.text = @"Your Long Term Goal At A Glance";
                _dateLabel.text = @"The Date To Achieve By";
            }
            
        }

    }
    
    //save the data that was pulled as default
    else if (savedName != nil)
    {
        
        
        //assign to text fields
        _nameLabel.text = savedName;
        _goalLabel.text = saveGoal;
        _dateLabel.text = saveDate;
        
        
        savedName = _nameLabel.text;
        saveGoal = _goalLabel.text;
        saveDate = _dateLabel.text;
        
        [defaults setObject:savedName forKey:@"filedName"];
        [defaults setObject:saveGoal forKey:@"filedGoal"];
        [defaults setObject:saveDate forKey:@"filedDate"];
        
        [defaults synchronize];
    }
}







@end
