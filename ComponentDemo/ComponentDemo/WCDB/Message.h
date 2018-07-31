//
//  Message.h
//  ComponentDemo
//
//  Created by 沈兆良 on 2018/7/30.
//  Copyright © 2018年 沈兆良. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <WCDB/WCDB.h>
@interface Message : NSObject
@property int localID;
@property(retain) NSString *content;
@property(retain) NSDate *createTime;
@property(retain) NSDate *modifiedTime;
@property(assign) int unused; //You can only define the properties you need
@end


@interface Message (WCTTableCoding) <WCTTableCoding>

WCDB_PROPERTY(localID)
WCDB_PROPERTY(content)
WCDB_PROPERTY(createTime)
WCDB_PROPERTY(modifiedTime)

@end
