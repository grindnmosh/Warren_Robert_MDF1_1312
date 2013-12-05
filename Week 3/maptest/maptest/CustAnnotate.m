//
//  CustAnnotate.m
//  maptest
//
//  Created by Robert Warren on 12/3/13.
//  Copyright (c) 2013 Robert Warren. All rights reserved.
//

#import "CustAnnotate.h"

@implementation CustAnnotate


-(id)initWithAnnotation:(id<MKAnnotation>)annotation reuseIdentifier:(NSString *)reuseIdentifier
{
    if ((self = [super initWithAnnotation:annotation reuseIdentifier:reuseIdentifier]))
    {
        self.image = [UIImage imageNamed:@"gtImage.png"];
    }
    return self;
}
@end
