//
//  BusinessClass.m
//  Warren_Robert_MDF1_Week3
//
//  Created by Robert Warren on 12/3/13.
//  Copyright (c) 2013 Robert Warren. All rights reserved.
//

#import "BusinessClass.h"

@implementation BusinessClass
@synthesize bizName, _location;

//location variables to call data with
-(id)initWithName:(NSString*)name locale:(CLLocationCoordinate2D)locale
{
    if ((self = [super init]))
    {
        bizName = name;
        _location = locale;
    }
    return self;
}




@end
