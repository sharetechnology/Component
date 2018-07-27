//
//  View1Controller.m
//  ComponentDemo
//
//  Created by 沈兆良 on 2018/7/27.
//  Copyright © 2018年 沈兆良. All rights reserved.
//

#import "View1Controller.h"

@interface View1Controller ()

@end

@implementation View1Controller

#pragma mark - --- 1.lift cycle 生命周期 ---

- (void)viewDidLoad{
    [super viewDidLoad];
    self.title = @"View1Controller";
    self.view.backgroundColor = [UIColor magentaColor];
}

- (void)dealloc{
    NSLog(@"%s %@", __FUNCTION__, self);
}

//- (BOOL)willDealloc {
//    NSLog(@"%s %@", __FUNCTION__, self);
//    return NO;
//}
#pragma mark - --- 2.delegate 视图委托 ---

#pragma mark - --- 3.event response 事件相应 ---
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    if ([self.delegate respondsToSelector:@selector(view1ControllerClick)]) {
        [self.delegate view1ControllerClick];
    }
}
#pragma mark - --- 4.private methods 私有方法 ---

#pragma mark - --- 5.setters 属性 ---

#pragma mark - --- 6.getters 属性 —--

@end
