//
//  main.m
//  ComponentDemo
//
//  Created by 沈兆良 on 2018/7/26.
//  Copyright © 2018年 沈兆良. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

#import <FBRetainCycleDetector/FBAssociationManager.h>

int main(int argc, char * argv[]) {
    @autoreleasepool {
        [FBAssociationManager hook];
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
