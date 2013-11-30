//
//  ViewController.m
//  Warren_Robert_MDF1_1312_Week1
//
//  Created by Robert Warren on 11/26/13.
//  Copyright (c) 2013 Robert Warren. All rights reserved.
//

#import "ViewController.h"
#import "Gift1View.h"
#import "Gift1.h"
#import "Gift2.h"
#import "Gift3.h"
#import "Gift4.h"
#import "Gift5.h"
#import "Gift6.h"
#import "Gift7.h"
#import "Gift8.h"
#import "Gift9.h"
#import "Gift10.h"
#import "Gift11.h"
#import "Gift12.h"
#import "Gift13.h"
#import "Gift14.h"
#import "Gift15.h"
#import "Gift16.h"
#import "Gift17.h"
#import "Gift18.h"
#import "Gift19.h"
#import "Gift20.h"




@interface ViewController () 

@end

@implementation ViewController

- (void)viewDidLoad
{
    santaSack = [[NSMutableArray alloc] initWithObjects:
                 @"27\" iMac\nWith 3.5Ghz CPU and 16gb Ram\n4gb Video Card and AppleCare",
                 @"2 24\" Samsung LED Monitors\nFull 1080p HD\n With both DVI and VGA inputs",
                 @"Samsung Galaxy Note 10.1\n2014 Edition 32gb model\nWith a 64gb Micr0Sd Card",
                 @"Nexus 10 Tablet\n2014 Edition 32GB Model/nFor Development use",
                 @"Apple Time Capsule\n2013 Model with 802.11ac technology\nFor backup and network drive",
                 @"PlayStation 4\nBattleField 4 and PS Plus Bundle\nExtra Controller",
                 @"XBox One\nDay One Edition\nExtra Controller",
                 @"Nintendo Wii U Deluxe Set\nWith New Super Mario Bros. U\nAnd New Super Luigi U",
                 @"Nintendo 3DS\nBlack on Black\nThe Legend of Zelda: A Link Between Worlds",
                 @"PlayStation Vita\n3G model\nBatman Arkham Origins",
                 @"iPad Air Wifi\n128gb Model Space Grey\nFor Development",
                 @"iPad Mini Retina Wifi\n128gb Model Space Grey\nFor Development",
                 @"iPhone 5s Unlocked\n64gb Model Space Grey\nFor Development",
                 @"Apple Tv\n 3rd Generation\nUpgrade My 2nd Generation",
                 @"Turtle Beach Ear Force X42\nWireless Dolby Surround Sound\nGaming Headset",
                 @"Samsung Galaxy Gear\nJet Black\n To sync with my Samsung Note 3",
                 @"Pebble SmartWatch\nJet Black\nFor syncing with everything else",
                 @"Google Glass\nPrescription Edition\nFor Development",
                 @"Call of Duty Ghost\nHardened Edition\nPS4 Edition",
                 @"Pair of Nike Coretez\nBlack and White\nLeather Version",
                 nil];
    self->charted.rowHeight = 100.f;
    [charted setEditing:false animated:true];
    
    
    [super viewDidLoad];
    
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section
{
    return [santaSack count];
}


-(UITableViewCellEditingStyle)tableview:(UITableView*)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewCellEditingStyleDelete;
    
}

-(void)tableView:(UITableView*)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        [santaSack removeObjectAtIndex:indexPath.section];
        [charted deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
        [charted setEditing:false animated:true];
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"Test";
   craptastic = [charted dequeueReusableCellWithIdentifier: cellId];
    if (craptastic == nil)
    {
        
        NSArray *loadedSleigh = [[NSBundle mainBundle] loadNibNamed:@"Gift1View" owner:nil options:nil];
        for (UIView *gifts in loadedSleigh)
        {
            if([gifts isKindOfClass:[Gift1View class]])
            {
                craptastic = (Gift1View*)gifts;
                
            }
        }
    }
    craptastic.tag = indexPath.row;
    craptastic->gift.text = (NSString*)[santaSack objectAtIndex:indexPath.row];
    craptastic.tag = indexPath.row;
    
    return craptastic;
    //tag++;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;
{
    //tag = indexPath.row;
    if (tag == 0) {
        [self performSegueWithIdentifier: @"gift4" sender: self];
    }
    else if (tag == 1)
    {
        [self performSegueWithIdentifier: @"gift5" sender: self];
    }
    else if (tag == 2)
    {
        [self performSegueWithIdentifier: @"gift7" sender: self];
    }
    else if (tag == 3)
    {
        [self performSegueWithIdentifier: @"gift8" sender: self];
    }
    else if (tag == 4)
    {
        [self performSegueWithIdentifier: @"gift19" sender: self];
    }
    else if (tag == 5)
    {
        [self performSegueWithIdentifier: @"gift20" sender: self];
    }
    else if (tag == 6)
    {
        [self performSegueWithIdentifier: @"gift13" sender: self];
    }
    else if (tag == 7)
    {
        [self performSegueWithIdentifier: @"gift14" sender: self];
    }
    else if (tag == 8)
    {
        [self performSegueWithIdentifier: @"gift15" sender: self];
    }
    else if (tag == 9)
    {
        [self performSegueWithIdentifier: @"gift16" sender: self];
    }
    else if (tag == 10)
    {
        [self performSegueWithIdentifier: @"gift17" sender: self];
    }
    else if (tag == 11)
    {
        [self performSegueWithIdentifier: @"gift18" sender: self];
    }
    else if (tag == 12)
    {
        [self performSegueWithIdentifier: @"gift9" sender: self];
    }
    else if (tag == 13)
    {
        [self performSegueWithIdentifier: @"gift10" sender: self];
    }
    else if (tag == 14)
    {
        [self performSegueWithIdentifier: @"gift11" sender: self];
    }
    else if (tag == 15)
    {
        [self performSegueWithIdentifier: @"gift12" sender: self];
    }
    else if (tag == 16)
    {
        [self performSegueWithIdentifier: @"gift3" sender: self];
    }
    else if (tag == 17)
    {
        [self performSegueWithIdentifier: @"gift2" sender: self];
    }
    else if (tag == 18)
    {
        [self performSegueWithIdentifier: @"gift1" sender: self];
    }
    else if (tag == 19)
    {
        [self performSegueWithIdentifier: @"gift6" sender: self];
    }
    
}

-(IBAction)onClick:(id)sender
{
    if (!charted.editing)
    {
        [charted setEditing:true animated:true];
    }
    else
    {
        [charted setEditing:false animated:true];
    }
}

-(IBAction)onTap:(id)sender
{
    
    
}



@end
