//
//  MapSetup.m
//  Warren_Robert_MDF1_Week3
//
//  Created by Robert Warren on 12/4/13.
//  Copyright (c) 2013 Robert Warren. All rights reserved.
//

#import "MapSetup.h"

@implementation MapSetup

//synthesize properties to call data through for annotations
@synthesize title, coordinate;

//map properties to call data through for annotations
-(id)initWithTitle:(NSString *)text coord:(CLLocationCoordinate2D)coord
{
    if (self = [super init])
    {
        //defining the vars to pass
        title = text;
        coordinate = coord;
    }
    return self;
}

@end
