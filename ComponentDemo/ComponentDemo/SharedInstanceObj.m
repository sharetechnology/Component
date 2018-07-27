//
//  SharedInstanceObj.m
//  ComponentDemo
//
//  Created by 沈兆良 on 2018/7/26.
//  Copyright © 2018年 沈兆良. All rights reserved.
//

#import "SharedInstanceObj.h"

@implementation SharedInstanceObj
static SharedInstanceObj *_sharedInstrance;
static dispatch_once_t onceToken;
+ (SharedInstanceObj *)sharedInstance{
    dispatch_once(&onceToken, ^{
        _sharedInstrance = [[self alloc] init];
        NSLog(@"%s %@", __FUNCTION__, self);
    });
    return _sharedInstrance;
}

+ (void)deallocShared{
    _sharedInstrance = nil;
}

- (void)dealloc{
    NSLog(@"%s %@", __FUNCTION__, self);
}

//- (BOOL)willDealloc {
//    NSLog(@"%s %@", __FUNCTION__, self);
//    return NO;
//}

@end
