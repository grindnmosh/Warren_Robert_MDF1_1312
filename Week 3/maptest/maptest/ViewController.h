//
//  ViewController.h
//  maptest
//
//  Created by Robert Warren on 12/2/13.
//  Copyright (c) 2013 Robert Warren. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>


@interface ViewController : UIViewController <MKMapViewDelegate>
{
    IBOutlet MKMapView *myMap;
    
}

@end
