//
//  AppDelegate.m
//  ComponentDemo
//
//  Created by 沈兆良 on 2018/7/26.
//  Copyright © 2018年 沈兆良. All rights reserved.
//

#import "AppDelegate.h"
@interface AppDelegate ()

@end

@implementation AppDelegate

/**
1.摇晃手机， 调用Xcode界面调试工具FLEX
 
FLEX是一个需要注入式的一种框架，从描述来看，功能非常多。主要来讲的话能够对正在运行的应用进行样式的修改和控件的读取。FLEX会赐予你SuperPower！！！
可以查看控件的坐标和属性
看任何一个对象的属性和成员变量
动态修改属性和成员变量
动态的调用实例和类方法 FLEX正因为是注入式的，所以不需要在链接LLDB或者Xocde，或者是远程的调试服务器，它可以在本地随时随地的进行自有的操作和调试
 **/


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
