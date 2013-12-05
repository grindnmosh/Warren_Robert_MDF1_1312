//
//  ViewController.m
//  maptest
//
//  Created by Robert Warren on 12/2/13.
//  Copyright (c) 2013 Robert Warren. All rights reserved.
//

#import "ViewController.h"
#import "MapTime.h"
#import "CustAnnotate.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    MKCoordinateSpan span;
    span.latitudeDelta = 5.0f;
    span.longitudeDelta = 5.0f;
    
    CLLocationCoordinate2D location;
    location.latitude = 33.45f;
    location.longitude = -112.0667f;
    
    MKCoordinateRegion region;
    region.center = location;
    region.span = span;
    myMap.region = region;
    
    CLLocationCoordinate2D phoenixLocation;
    phoenixLocation.latitude = 33.45f;
    phoenixLocation.longitude = -112.0667f;
    
    MapTime *annotateMe = [[MapTime alloc] initWithTitle:@"Phoenix" coord:phoenixLocation];
    [myMap addAnnotation:annotateMe];
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

-(MKAnnotationView*)mapView:(MKMapView*)mapView viewForAnnotation:(id<MKAnnotation>)getAnnotated
{
    //MKPinAnnotationView *annotated = [[MKPinAnnotationView alloc] initWithAnnotation:getAnnotated reuseIdentifier:@"Customized"];
    
    CustAnnotate *annotated = [[CustAnnotate alloc] initWithAnnotation:getAnnotated reuseIdentifier:@"Customized"];
    
    //UIImageView *gtImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"gtImage.png"]];
    
    //annotated.animatesDrop = true;
    annotated.canShowCallout = YES;
    annotated.calloutOffset = CGPointMake(-20, 5);
    
    return annotated;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
