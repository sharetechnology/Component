//
//  Message.m
//  ComponentDemo
//
//  Created by 沈兆良 on 2018/7/30.
//  Copyright © 2018年 沈兆良. All rights reserved.
//

#import "Message.h"

@implementation Message

WCDB_IMPLEMENTATION(Message)
WCDB_SYNTHESIZE(Message, localID)
WCDB_SYNTHESIZE(Message, content)
WCDB_SYNTHESIZE(Message, createTime)
WCDB_SYNTHESIZE(Message, modifiedTime)

WCDB_PRIMARY(Message, localID)

WCDB_INDEX(Message, "_index", createTime)

@end
