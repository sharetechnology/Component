//
//  SharedInstanceObj.h
//  ComponentDemo
//
//  Created by 沈兆良 on 2018/7/26.
//  Copyright © 2018年 沈兆良. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SharedInstanceObj : NSObject
+ (SharedInstanceObj *)sharedInstance;
+ (void)deallocShared;
@end
