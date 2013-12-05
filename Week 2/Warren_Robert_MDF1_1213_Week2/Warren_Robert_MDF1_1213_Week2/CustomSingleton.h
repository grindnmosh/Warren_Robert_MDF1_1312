//
//  CustomSingleton.h
//  Warren_Robert_MDF1_1213_Week2
//
//  Created by Robert Warren on 12/3/13.
//  Copyright (c) 2013 Robert Warren. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CustomSingleton : NSObject
{
    NSString *uniName;
    NSString *uniGoal;
    NSString *uniDate;
}


@property(nonatomic)NSString *uniName;

@property(nonatomic)NSString *uniGoal;

@property(nonatomic)NSString *uniDate;

+(CustomSingleton *) singleOBJ;



@end
