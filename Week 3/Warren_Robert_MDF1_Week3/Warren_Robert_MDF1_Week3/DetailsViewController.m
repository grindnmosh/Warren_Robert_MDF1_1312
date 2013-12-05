//
//  DetailsViewController.m
//  Warren_Robert_MDF1_Week3
//
//  Created by Robert Warren on 12/3/13.
//  Copyright (c) 2013 Robert Warren. All rights reserved.
//

#import "DetailsViewController.h"
#import "MapSetup.h"

@interface DetailsViewController ()

@end

@implementation DetailsViewController

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
    
	// Do any additional setup after loading the view.
}

-(void)viewDidAppear:(BOOL)animated
{
    
    //set span
    MKCoordinateSpan span;
    span.latitudeDelta = 0.0005f;
    span.longitudeDelta = 0.0005f;
    
    //set center point
    CLLocationCoordinate2D location;
    location.latitude = _thisLocation.latitude;
    location.longitude = _thisLocation.longitude;
    
    //set region
    MKCoordinateRegion region;
    region.center = location;
    region.span = span;
    myMap.region = region;
    
    //pull custom object data
    businesses = [Database sharedDataManager];
    locations = businesses.businessName;
    NSLog(@"%@", locations);
    
    //load data into map based on selected row
    MapSetup *data = [[MapSetup alloc] initWithTitle:_thisName coord:_thisLocation];
    NSLog(@"%@ %f, %f", _thisName, _thisLocation.latitude, _thisLocation.longitude);
    //drop pins on map
    [myMap addAnnotation:data];
    
    //create vars for labels
    NSString *thisLat = [NSString stringWithFormat:@"Latitude: %f", _thisLocation.latitude];
    NSString *thisLong = [NSString stringWithFormat:@"Longitude: %f", _thisLocation.longitude];
    
    //write to labels
    self->name.text = self.thisName;
    self->lat.text = thisLat;
    self->lon.text = thisLong;
    
    [super viewDidAppear:animated];
}

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

-(IBAction)toClose:(id)sender
{
    // close viewer
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
