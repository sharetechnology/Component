//
//  View2Controller.m
//  ComponentDemo
//
//  Created by 沈兆良 on 2018/7/27.
//  Copyright © 2018年 沈兆良. All rights reserved.
//

#import "View2Controller.h"

@interface View2Controller ()
@property (nonatomic, copy) dispatch_block_t block;
@property (nonatomic, assign) NSInteger tem;
@end

@implementation View2Controller

#pragma mark - --- 1.lift cycle ---

- (void)viewDidLoad{
    [super viewDidLoad];
    self.title = @"View2Controller";
    self.view.backgroundColor = [UIColor yellowColor];
    
    self.block = ^{
        self.tem = 1;
    };
//    Capturing 'self' strongly in this block is likely to lead to a retain cycle
}

- (void)dealloc{
    NSLog(@"%s %@", __FUNCTION__, self);
}

//- (BOOL)willDealloc {
//    NSLog(@"%s %@", __FUNCTION__, self);
//    return NO;
//}
#pragma mark - --- 2.delegate ---

#pragma mark - --- 3.event response ---

#pragma mark - --- 4.private methods ---

#pragma mark - --- 5.setters ---

#pragma mark - --- 6.getters —--

@end

#if 0
@interface ClassA ()
@property (nonatomic, copy) dispatch_block_t block;
@property (nonatomic, assign) NSInteger tem;
@end
@implementation ClassA
- (void)viewDidLoad{
    [super viewDidLoad];
    self.block = ^{ self.tem = 1; };
}
@end

如上代码，self持有block，而堆上的block又会持有self，所以会导致循环引用，这个例子非常好，
因为xcode都能检测出来，报出警告：
[capturing self strongly in this block is likely to lead to a retain cycle]，
当然大部分循环引用的情况xcode是不会报警告的。
解决这种循环引用的常用方式如下（这种解决方式可以解决大部分block引起的循环引用，但是有一定缺陷，且看下一节）：

@interface ClassA ()
@property (nonatomic, copy) dispatch_block_t block;
@property (nonatomic, assign) NSInteger tem;
@end
@implementation ClassA
- (void)viewDidLoad {
    [super viewDidLoad];
    __weak typeof(self) weakSelf = self
    self.block = ^{
        weakSelf.tem = 1;
    };
}


如上delegate和block引起的循环引用的处理方式，有一个共同的特点，就是使用weak（弱引用）来打破环，使环消失了。
所以，可以得出结论，我们可以通过使用将strong（强引用）用weak（弱引用）代替来解决循环引用。

#endif


