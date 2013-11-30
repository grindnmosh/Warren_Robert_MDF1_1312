//
//  GiftData.m
//  Warren_Robert_MDF1_1312_Week1_ver2
//
//  Created by Robert Warren on 11/28/13.
//  Copyright (c) 2013 Robert Warren. All rights reserved.
//

#import "GiftData.h"

@interface GiftData ()
@property (weak, nonatomic) IBOutlet UIImageView *prodImage;
@property (weak, nonatomic) IBOutlet UILabel *prodName;
@property (weak, nonatomic) IBOutlet UILabel *proddetail;

@end

@implementation GiftData

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


//properties pass here and assign to the IBOutlets
- (void)viewDidLoad
{
    
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    //image
    self.prodImage.image = self.insertImage;
    self.prodImage.frame = CGRectMake(8.0f, 103.0f, 200.0f, 150.0f);
    //Product Name
    self.prodName.text = self.insertName;
    //Product Details
    self.proddetail.text = self.InsertInfo;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
