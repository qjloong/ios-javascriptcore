//
//  Person.m
//  test-javascriptcore
//
//  Created by qycloud on 15-4-15.
//  Copyright (c) 2015年 qycloud. All rights reserved.
//

#import "Person.h"



@implementation Person

@synthesize firstName, lastName, urls;

- (NSString *)fullName
{
    return [NSString stringWithFormat:@"%@ %@",self.firstName, self.lastName];
}

@end
