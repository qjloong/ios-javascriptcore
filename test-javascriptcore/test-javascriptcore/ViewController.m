//
//  ViewController.m
//  test-javascriptcore
//
//  Created by qycloud on 15-4-15.
//  Copyright (c) 2015年 qycloud. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //[self test1];
    
    [self test2];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)test1
{
    JSContext *context = [[JSContext alloc] init];
    JSValue *jsVal = [context evaluateScript:@"21+7"];
    int iVal = [jsVal toInt32];
    NSLog(@"JSValue: %@, int: %d", jsVal, iVal);
}



- (void)test2
{
    JSContext *context = [[JSContext alloc] init];
    context.exceptionHandler = ^(JSContext *con, JSValue *exception) {
        NSLog(@"%@", exception);
        con.exception = exception;
    };
    
    context[@"log"] = ^() {
        NSArray *args = [JSContext currentArguments];
        for (id obj in args) {
            NSLog(@"%@",obj);
        }
    };
    
    Person *person = [[Person alloc] init];
    context[@"p"] = person;
    person.lastName = @"qyt";
    person.urls = @{@"site": @"http://opensource.apple.com/source/JavaScriptCore"};
    
    [context evaluateScript:@"log(p.fullName());"];
    
    [context evaluateScript:@"log('site:', p.urls.site, 'blog:', p.urls.blog);"];

    [context evaluateScript:@"log(p.fullName());"];
    
    [context evaluateScript:@"p.urls = {blog:'https://github.com/blog'}"];
    
    [context evaluateScript:@"log('site:', p.urls.site, 'blog:', p.urls.blog);"];
    
    NSLog(@"%@",person.urls);
}

@end
