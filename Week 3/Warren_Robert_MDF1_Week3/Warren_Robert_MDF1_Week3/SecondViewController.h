//
//  SecondViewController.h
//  Warren_Robert_MDF1_Week3
//
//  Created by Robert Warren on 12/3/13.
//  Copyright (c) 2013 Robert Warren. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "BusinessClass.h"
#import "Database.h"

@interface SecondViewController : UIViewController
{
    //singleton call
    Database *businesses;
    
    //vars for cleaner data
    NSMutableArray *businessName;
    NSMutableArray *locations;
    IBOutlet MKMapView *myMap;
}
@end
