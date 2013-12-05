//
//  CustomSingleton.m
//  Warren_Robert_MDF1_1213_Week2
//
//  Created by Robert Warren on 12/3/13.
//  Copyright (c) 2013 Robert Warren. All rights reserved.
//

#import "CustomSingleton.h"

@implementation CustomSingleton

//singleton vars
@synthesize uniName, uniGoal, uniDate;

//singleton static method
+(CustomSingleton*)singleOBJ
{
    static CustomSingleton *singleton = nil;
    @synchronized(self)
    {
        if (!singleton)
        {
            singleton = [[CustomSingleton alloc] init];
        }
        return singleton;
    }
    
}

@end
