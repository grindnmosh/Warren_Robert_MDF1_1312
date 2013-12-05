//
//  MapTime.m
//  maptest
//
//  Created by Robert Warren on 12/3/13.
//  Copyright (c) 2013 Robert Warren. All rights reserved.
//

#import "MapTime.h"

@implementation MapTime

@synthesize title, coordinate;
-(id)initWithTitle:(NSString *)text coord:(CLLocationCoordinate2D)coord
{
    if (self = [super init])
    {
        title = text;
        coordinate = coord;
    }
    return self;
}
@end
