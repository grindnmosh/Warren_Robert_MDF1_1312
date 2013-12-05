//
//  Database.h
//  Warren_Robert_MDF1_Week3
//
//  Created by Robert Warren on 12/3/13.
//  Copyright (c) 2013 Robert Warren. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Database : NSObject
{
    //array var
    NSMutableArray *businessName;
}

//static singleton call
+(Database*)sharedDataManager;

//singleton array
@property (nonatomic, strong) NSMutableArray *businessName;

@end
