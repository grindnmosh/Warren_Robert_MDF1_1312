//
//  MapSetup.h
//  Warren_Robert_MDF1_Week3
//
//  Created by Robert Warren on 12/4/13.
//  Copyright (c) 2013 Robert Warren. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface MapSetup : NSObject <MKAnnotation>
{
    //map vars
    NSString *title;
    CLLocationCoordinate2D coordinate;
}

//map method
-(id)initWithTitle:(NSString*)text coord:(CLLocationCoordinate2D)coord;

//map properties to call data through for annotations
@property (nonatomic, copy) NSString *title;
@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;

@end
