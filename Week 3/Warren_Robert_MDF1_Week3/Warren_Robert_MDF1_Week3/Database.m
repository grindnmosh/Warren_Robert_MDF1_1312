//
//  Database.m
//  Warren_Robert_MDF1_Week3
//
//  Created by Robert Warren on 12/3/13.
//  Copyright (c) 2013 Robert Warren. All rights reserved.
//

#import "Database.h"

@implementation Database

@synthesize businessName;

//static singleton method
static Database* _sharedDataManager = nil;
+(Database*)sharedDataManager
{
    if (!_sharedDataManager)
    {
        _sharedDataManager = [[self alloc] init];
    }
    return _sharedDataManager;
}

//init to allow adding dynamically unused
-(id)init
{
    if ((self = [super init]))
    {
        businessName = [[NSMutableArray alloc] init];
    }
    return self;
}

@end
