//
//  ViewController.m
//  Week1Practice
//
//  Created by Robert Warren on 11/26/13.
//  Copyright (c) 2013 Robert Warren. All rights reserved.
//

#import "ViewController.h"
#import "CustomCell.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    loadedGun = [[NSMutableArray alloc] initWithObjects:@"insane", @"crazy", @"loony", @"nuts", @"freak", @"mental", @"loopy", @"lost", @"card short", @"ditzy", @"straight Jacket", @"funny farm", nil];
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

-(void)viewDidAppear:(BOOL)animated
{
    [tables setEditing:true animated:true];
    [super viewDidAppear:animated];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (NSInteger)tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section
{
    return [loadedGun count];
}


-(UITableViewCellEditingStyle)tableview:(UITableView*)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewCellEditingStyleInsert;
    
}

-(void)tableView:(UITableView*)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    [loadedGun removeObjectAtIndex:indexPath.row];
    [tables deleteRowsAtIndexPaths:[NSArray arrayWithObjects:indexPath, nil] withRowAnimation:true];
    
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"Test";
    CustomCell *craptastic = [tables dequeueReusableCellWithIdentifier: cellId];
    if (craptastic == nil)
    {
        //craptastic = [[CustomCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
        NSArray* loaded = [[NSBundle mainBundle] loadNibNamed:@"CustomCell" owner:nil options:nil];
        craptastic.textLabel.text = (NSString*)[loadedGun objectAtIndex:indexPath.row];
        for (UIView *load in loaded)
        {
            if([load isKindOfClass:[CustomCell class]])
            craptastic = (CustomCell*)load;
            craptastic->arrayed.text = (NSString*)[loadedGun objectAtIndex:indexPath.row];
        }
    }
    static int count = 0;
    
    count++;
    return craptastic;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;
{
    
}

@end
