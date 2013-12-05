//
//  WebViewController.m
//  Warren_Robert_MDF1_1213_Week2
//
//  Created by Robert Warren on 12/1/13.
//  Copyright (c) 2013 Robert Warren. All rights reserved.
//

#import "WebViewController.h"
#import "OptionsViewController.h"

@interface WebViewController ()
@property (weak, nonatomic) IBOutlet UIWebView *exampleSite;

@end

@implementation WebViewController

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
    self.title = @"Examples";
    [super viewDidLoad];
    //call url property into webviewer
    NSURLRequest *urlReq = [NSURLRequest requestWithURL:[NSURL URLWithString:_goGoUrl]];
    
    //set to full screen of web viewer
    _exampleSite.scalesPageToFit = YES;
    
    //load url into webviewer
    [self.exampleSite loadRequest:urlReq];
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
