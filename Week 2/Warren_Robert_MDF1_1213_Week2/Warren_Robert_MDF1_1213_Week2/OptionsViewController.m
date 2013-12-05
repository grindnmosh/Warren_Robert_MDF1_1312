//
//  OptionsViewController.m
//  Warren_Robert_MDF1_1213_Week2
//
//  Created by Robert Warren on 12/1/13.
//  Copyright (c) 2013 Robert Warren. All rights reserved.
//

#import "OptionsViewController.h"
#import "WebViewController.h"

@interface OptionsViewController ()
{
    //passing url property
    NSString *getUrl;
}
@end

@implementation OptionsViewController

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
    //set page title
    self.title = @"Suggestions";
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//pass selected url to next view controller
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    if ([[segue identifier] isEqualToString:@"WebViewController"])
    {
        WebViewController *destination = segue.destinationViewController;
        destination.goGoUrl = getUrl;
        
        
    }
}

//pass url strings to segue
-(IBAction)onClick:(UIButton*)button
{
    if (button.tag == 0)
    {
        getUrl = @"http://www.grind-design.com";
        [self performSegueWithIdentifier: @"WebViewController" sender: self];
        
    }
    else if (button.tag == 1)
    {
        getUrl = @"https://www.facebook.com/GrindDesign";
        [self performSegueWithIdentifier: @"WebViewController" sender: self];
        
    }
    else if (button.tag == 2)
    {
        getUrl = @"https://developer.apple.com/register/index.action";
        [self performSegueWithIdentifier: @"WebViewController" sender: self];

    }
}

@end
