//
//  DetailsViewController.h
//  Warren_Robert_MDF1_Week3
//
//  Created by Robert Warren on 12/3/13.
//  Copyright (c) 2013 Robert Warren. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "BusinessClass.h"
#import "Database.h"

@interface DetailsViewController : UIViewController
{
    //singleton call
    Database *businesses;
    
    //vars for cleaner data
    NSMutableArray *businessName;
    NSMutableArray *locations;
    IBOutlet MKMapView *myMap;
    IBOutlet UILabel *name;
    IBOutlet UILabel *lat;
    IBOutlet UILabel *lon;
}

-(IBAction)toClose:(id)sender;

//properties to pass data between views
@property (strong, nonatomic)  NSString *thisName;
@property (readwrite, nonatomic)  CLLocationCoordinate2D thisLocation;

@end
