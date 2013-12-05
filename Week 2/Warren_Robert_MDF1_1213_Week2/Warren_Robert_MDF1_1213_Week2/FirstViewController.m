//
//  FirstViewController.m
//  Warren_Robert_MDF1_1213_Week2
//
//  Created by Robert Warren on 11/29/13.
//  Copyright (c) 2013 Robert Warren. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad
{
    //set page title
    self.title = @"General";
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//unwind button
-(IBAction)done:(UIStoryboardSegue*)segue
{
    
}



@end
