//
//  TopicViewController.m
//  Warren_Robert_MDF1_1213_Week2
//
//  Created by Robert Warren on 11/30/13.
//  Copyright (c) 2013 Robert Warren. All rights reserved.
//

#import "TopicViewController.h"

@interface TopicViewController ()
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *info;
@property (weak, nonatomic) IBOutlet UILabel *url;

@end

@implementation TopicViewController

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
    //load property data to screen
    self.name.text = self.artName;
    self.info.text = self.artInfo;
    self.url.text = self.artUrl;
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)toClose:(id)sender
{
    // close viewer
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
