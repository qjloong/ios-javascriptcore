//
//  Person.h
//  test-javascriptcore
//
//  Created by qycloud on 15-4-15.
//  Copyright (c) 2015年 qycloud. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JavaScriptCore/JavaScriptCore.h>

@protocol personProtocol <JSExport>

@property (nonatomic, retain) NSDictionary *urls;
- (NSString *)fullName;
@end



@interface Person : NSObject<personProtocol>


@property (nonatomic,readonly) NSString *firstName;
@property (nonatomic,copy) NSString *lastName;


@end
