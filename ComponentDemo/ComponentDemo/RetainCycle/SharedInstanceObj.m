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

//+ (SharedInstanceObj *)sharedInstance{
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        _sharedInstrance = [[self alloc] init];
//        NSLog(@"%s %@", __FUNCTION__, self);
//    });
//    return _sharedInstrance;
//}

/**
dispatch_once使得block中的代码执行且只执行一次，在多线程竞态时，使其他线程进入等待状态直至block执行完毕，并且还保证无竞态时执行效率与非线程安全的if语句效率相当。
dispatch_once内部使用了大量的原子操作来替代锁与信号量，这使得其效率大大提升，但带来的是维护和阅读性的降低。
dispatch_once被大量使用在构建单例上，apple也推荐如此
 **/

+ (SharedInstanceObj *)sharedInstance{
    if (_sharedInstrance == nil) {
        _sharedInstrance = [[SharedInstanceObj alloc] init];
        NSLog(@"%s %@", __FUNCTION__, self);
    }
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
