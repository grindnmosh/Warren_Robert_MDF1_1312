//
//  FirstViewController.m
//  Warren_Robert_MDF1_Week3
//
//  Created by Robert Warren on 12/3/13.
//  Copyright (c) 2013 Robert Warren. All rights reserved.
//

#import "FirstViewController.h"
#import "BusinessClass.h"
#import "Database.h"
#import "DetailsViewController.h"

@interface FirstViewController ()
{
    //vars for singleton
    NSString *toInsertTitle;
    CLLocationCoordinate2D toInserLocation;
 
    
}
@end

@implementation FirstViewController


- (void)viewDidLoad
{
    //create locations to load into object
    BusinessClass *load1 = [[BusinessClass alloc] initWithName:@"GrindTime CoffeeHouse #1" locale:CLLocationCoordinate2DMake(34.5445482f, -112.4524543f)];
    BusinessClass *load2 = [[BusinessClass alloc] initWithName:@"GrindTime CoffeeHouse #2" locale:CLLocationCoordinate2DMake(33.96588029999999f, -112.73282899999998)];
    BusinessClass *load3 = [[BusinessClass alloc] initWithName:@"GrindTime CoffeeHouse #3" locale:CLLocationCoordinate2DMake(33.4421082, -112.55557429999999f)];
    BusinessClass *load4 = [[BusinessClass alloc] initWithName:@"GrindTime CoffeeHouse #4" locale:CLLocationCoordinate2DMake(33.4220371, -111.54654820000002)];
    BusinessClass *load5 = [[BusinessClass alloc] initWithName:@"GrindTime CoffeeHouse #5" locale:CLLocationCoordinate2DMake(33.6251974f, -112.3339955000000f)];
    BusinessClass *load6 = [[BusinessClass alloc] initWithName:@"GrindTime CoffeeHouse #6" locale:CLLocationCoordinate2DMake(35.239723f, -114.037194f)];
    BusinessClass *load7 = [[BusinessClass alloc] initWithName:@"GrindTime CoffeeHouse #7" locale:CLLocationCoordinate2DMake(33.7973036f, -111.97683749999999)];
    BusinessClass *load8 = [[BusinessClass alloc] initWithName:@"GrindTime CoffeeHouse #8" locale:CLLocationCoordinate2DMake(32.2364522f, -110.92490370000002f)];
    BusinessClass *load9 = [[BusinessClass alloc] initWithName:@"GrindTime CoffeeHouse #9" locale:CLLocationCoordinate2DMake(34.536395f, -114.35240299999998f)];
    BusinessClass *load10 = [[BusinessClass alloc] initWithName:@"GrindTime CoffeeHouse #10" locale:CLLocationCoordinate2DMake(32.8936546f, -111.7405556f)];
    
    //create shared manager
    Database *database = [Database sharedDataManager];
    if (database != nil)
    {
        //create businessName Loader
        businessName = database.businessName;
        if (businessName != nil)
        {
            //load locations into object
            [businessName addObject:load1];
            [businessName addObject:load2];
            [businessName addObject:load3];
            [businessName addObject:load4];
            [businessName addObject:load5];
            [businessName addObject:load6];
            [businessName addObject:load7];
            [businessName addObject:load8];
            [businessName addObject:load9];
            [businessName addObject:load10];
        }
    }
    
    //load dat from object into view
    businesses = [Database sharedDataManager];
    locations = businesses.businessName;
    
    //set row height
    self->_tableView.rowHeight = 50.0f;
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

-(void)viewDidAppear:(BOOL)animated
{
    
    
    [super viewDidAppear:animated];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section
{
    NSLog(@"%d", [locations count]);
    return [locations count];
    
}

//commit to the delete here.
-(void)tableView:(UITableView*)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    //verify editing style
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        //remove object from UI
        [locations removeObjectAtIndex:indexPath.section];
        //remove from arrays
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

//create tags and insert data
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //create tags
    static NSString *cellId = @"Test";
    bizCell = [_tableView dequeueReusableCellWithIdentifier: cellId];
    if (bizCell == nil)
    {
        bizCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    //load location
    NSLog(@"%@", [locations description]);
    bizCell.textLabel.text = [[locations objectAtIndex:indexPath.row]bizName];
    return bizCell;
    
}


//set editing control on or off
-(IBAction)onClick:(id)sender
{
    //set on
    if (!_tableView.editing)
    {
        [_tableView setEditing:true animated:true];
    }
    //set off
    else
    {
        [_tableView setEditing:false animated:true];
    }
}

//universal segue call to pass the custom data to detail page
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"detail"])
    {
        DetailsViewController *destination = segue.destinationViewController;
        destination.thisName = toInsertTitle;
        destination.thisLocation = toInserLocation;
        
        
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //row 1 info
    grabData = (UITableViewCell*)[_tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:indexPath.row  inSection:0]];
    textVal = [grabData.textLabel text];
    if ([textVal  isEqual: @"GrindTime CoffeeHouse #1"])
    {
        NSString *thisName = [[locations objectAtIndex:indexPath.row]bizName];
        CLLocationCoordinate2D thisLocation = [[locations objectAtIndex:indexPath.row]_location];
        
       
        NSLog(@"%@ %f, %f", thisName, thisLocation.latitude, thisLocation.longitude);
        toInsertTitle = thisName;
        toInserLocation = thisLocation;
        
       
        [self performSegueWithIdentifier: @"detail" sender: self];
    }
    //row 2 info
    else if ([textVal  isEqual: @"GrindTime CoffeeHouse #2"])
    {
        NSString *thisName = [[locations objectAtIndex:indexPath.row]bizName];
        CLLocationCoordinate2D thisLocation = [[locations objectAtIndex:indexPath.row]_location];
        
        
        NSLog(@"%@ %f, %f", thisName, thisLocation.latitude, thisLocation.longitude);
        toInsertTitle = thisName;
        toInserLocation = thisLocation;
        
        [self performSegueWithIdentifier: @"detail" sender: self];
    }
    //row 3 info
    else if ([textVal  isEqual: @"GrindTime CoffeeHouse #3"])
    {
        NSString *thisName = [[locations objectAtIndex:indexPath.row]bizName];
        CLLocationCoordinate2D thisLocation = [[locations objectAtIndex:indexPath.row]_location];
        
        
        NSLog(@"%@ %f, %f", thisName, thisLocation.latitude, thisLocation.longitude);
        toInsertTitle = thisName;
        toInserLocation = thisLocation;
       
        [self performSegueWithIdentifier: @"detail" sender: self];
    }
    //row 4 info
    else if ([textVal  isEqual: @"GrindTime CoffeeHouse #4"])
    {
        NSString *thisName = [[locations objectAtIndex:indexPath.row]bizName];
        CLLocationCoordinate2D thisLocation = [[locations objectAtIndex:indexPath.row]_location];
        
        
        NSLog(@"%@ %f, %f", thisName, thisLocation.latitude, thisLocation.longitude);
        toInsertTitle = thisName;
        toInserLocation = thisLocation;
        
        [self performSegueWithIdentifier: @"detail" sender: self];
    }
    //row 5 info
    else if ([textVal  isEqual: @"GrindTime CoffeeHouse #5"])
    {
        NSString *thisName = [[locations objectAtIndex:indexPath.row]bizName];
        CLLocationCoordinate2D thisLocation = [[locations objectAtIndex:indexPath.row]_location];
        
        
        NSLog(@"%@ %f, %f", thisName, thisLocation.latitude, thisLocation.longitude);
        toInsertTitle = thisName;
        toInserLocation = thisLocation;
        
        [self performSegueWithIdentifier: @"detail" sender: self];
    }
    //row 6 info
    else if ([textVal  isEqual: @"GrindTime CoffeeHouse #6"])
    {
        NSString *thisName = [[locations objectAtIndex:indexPath.row]bizName];
        CLLocationCoordinate2D thisLocation = [[locations objectAtIndex:indexPath.row]_location];
        
        
        NSLog(@"%@ %f, %f", thisName, thisLocation.latitude, thisLocation.longitude);
        toInsertTitle = thisName;
        toInserLocation = thisLocation;
        
        [self performSegueWithIdentifier: @"detail" sender: self];
    }
    //row 7 info
    else if ([textVal  isEqual: @"GrindTime CoffeeHouse #7"])
    {
        NSString *thisName = [[locations objectAtIndex:indexPath.row]bizName];
        CLLocationCoordinate2D thisLocation = [[locations objectAtIndex:indexPath.row]_location];
        
        
        NSLog(@"%@ %f, %f", thisName, thisLocation.latitude, thisLocation.longitude);
        toInsertTitle = thisName;
        toInserLocation = thisLocation;
        
        [self performSegueWithIdentifier: @"detail" sender: self];
    }
    //row 8 info
    else if ([textVal  isEqual: @"GrindTime CoffeeHouse #8"])
    {
        NSString *thisName = [[locations objectAtIndex:indexPath.row]bizName];
        CLLocationCoordinate2D thisLocation = [[locations objectAtIndex:indexPath.row]_location];
        
        
        NSLog(@"%@ %f, %f", thisName, thisLocation.latitude, thisLocation.longitude);
        toInsertTitle = thisName;
        toInserLocation = thisLocation;
        
        [self performSegueWithIdentifier: @"detail" sender: self];
    }
    //row 9 info
    else if ([textVal  isEqual: @"GrindTime CoffeeHouse #9"])
    {
        NSString *thisName = [[locations objectAtIndex:indexPath.row]bizName];
        CLLocationCoordinate2D thisLocation = [[locations objectAtIndex:indexPath.row]_location];
        
        
        NSLog(@"%@ %f, %f", thisName, thisLocation.latitude, thisLocation.longitude);
        toInsertTitle = thisName;
        toInserLocation = thisLocation;
        
        [self performSegueWithIdentifier: @"detail" sender: self];
    }
    //row 10 info
    else if ([textVal  isEqual: @"GrindTime CoffeeHouse #10"])
    {
        NSString *thisName = [[locations objectAtIndex:indexPath.row]bizName];
        CLLocationCoordinate2D thisLocation = [[locations objectAtIndex:indexPath.row]_location];
        
        
        NSLog(@"%@ %f, %f", thisName, thisLocation.latitude, thisLocation.longitude);
        toInsertTitle = thisName;
        toInserLocation = thisLocation;
        
        [self performSegueWithIdentifier: @"detail" sender: self];
    }

    
}


@end
