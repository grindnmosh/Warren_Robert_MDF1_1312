//
//  Gift11.m
//  Warren_Robert_MDF1_1312_Week1
//
//  Created by Robert Warren on 11/27/13.
//  Copyright (c) 2013 Robert Warren. All rights reserved.
//

#import "Gift11.h"

@interface Gift11 ()

@end

@implementation Gift11

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
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)onClick:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
