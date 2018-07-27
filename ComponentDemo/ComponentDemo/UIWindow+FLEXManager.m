//
//  UIWindow+FLEXManager.m
//  ComponentDemo
//
//  Created by 沈兆良 on 2018/7/27.
//  Copyright © 2018年 沈兆良. All rights reserved.
//

#import "UIWindow+FLEXManager.h"

#if DEBUG
#import "FLEXManager.h"
#endif

@implementation UIWindow (FLEXManager)
#if DEBUG
- (void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event{
    [super motionBegan:motion withEvent:event];
    if (motion == UIEventSubtypeMotionShake) {
        [[FLEXManager sharedManager] showExplorer];
        
    }
}
#endif
@end

