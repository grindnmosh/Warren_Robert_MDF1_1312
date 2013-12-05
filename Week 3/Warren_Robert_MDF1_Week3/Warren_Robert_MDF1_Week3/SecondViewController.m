//
//  SecondViewController.m
//  Warren_Robert_MDF1_Week3
//
//  Created by Robert Warren on 12/3/13.
//  Copyright (c) 2013 Robert Warren. All rights reserved.
//

#import "SecondViewController.h"
#import "MapSetup.h"
#import "BusinessClass.h"
#import "Database.h"


@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad
{
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

-(void)viewDidAppear:(BOOL)animated
{
    //remove current pins to refresh
    [myMap removeAnnotations:myMap.annotations];
    
    //set span
    MKCoordinateSpan span;
    span.latitudeDelta = 5.0f;
    span.longitudeDelta = 5.0f;
    
    //set center point
    CLLocationCoordinate2D location;
    location.latitude = 33.45f;
    location.longitude = -112.0667f;
    
    //set region
    MKCoordinateRegion region;
    region.center = location;
    region.span = span;
    myMap.region = region;
    
    //pull custom object data
    businesses = [Database sharedDataManager];
    locations = businesses.businessName;
    NSLog(@"%@", locations);
    
    //loop through data and drop pins
    for (int i =0; i < [locations count]; i++)
    {
        //grab and assign data from object
        NSString *thisName = [[locations objectAtIndex:i]bizName];
        CLLocationCoordinate2D thisLocation = [[locations objectAtIndex:i]_location];
        
        //use data to define pin location and title
        MapSetup *data = [[MapSetup alloc] initWithTitle:thisName coord:thisLocation];
        NSLog(@"%@ %f, %f", thisName, thisLocation.latitude, thisLocation.longitude);
        
        //drop pins
        [myMap addAnnotation:data];
        
        
    }

    [super viewDidAppear:animated];
}

//add special effects and customizations
-(MKAnnotationView*)mapView:(MKMapView*)mapView viewForAnnotation:(id<MKAnnotation>)getAnnotated
{
    //customize pin but keep a pin
    MKPinAnnotationView *annotated = [[MKPinAnnotationView alloc] initWithAnnotation:getAnnotated reuseIdentifier:@"Customized"];
    //create image view
    UIImageView *gtImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"gtImage.png"]];
    
    //drop pin animation
    annotated.animatesDrop = true;
    // show business name
    annotated.canShowCallout = YES;
    
    //offset callout
    annotated.calloutOffset = CGPointMake(-20, 5);
    
    //add image to pin
    [annotated addSubview:gtImage];
    
    return annotated;
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
