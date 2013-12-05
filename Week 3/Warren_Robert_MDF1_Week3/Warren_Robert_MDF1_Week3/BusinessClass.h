//
//  BusinessClass.h
//  Warren_Robert_MDF1_Week3
//
//  Created by Robert Warren on 12/3/13.
//  Copyright (c) 2013 Robert Warren. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@interface BusinessClass : NSObject
{
    //vars to call data with
    NSString *bizName;
    CLLocationCoordinate2D _location;
}

-(id)initWithName:(NSString*)name locale:(CLLocationCoordinate2D)locale;

//property to call business name with
@property(nonatomic, strong)NSString *bizName;

//property to call business location with
@property(nonatomic, assign)CLLocationCoordinate2D _location;

@end
