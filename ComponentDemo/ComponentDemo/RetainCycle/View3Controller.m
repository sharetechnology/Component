//
//  View3Controller.m
//  ComponentDemo
//
//  Created by 沈兆良 on 2018/7/27.
//  Copyright © 2018年 沈兆良. All rights reserved.
//

#import "View3Controller.h"
#import "EXTScope.h"

@interface View3Controller ()
@property (nonatomic, copy) dispatch_block_t block;
@property (nonatomic, strong) NSString *str;
@end

@implementation View3Controller

#pragma mark - --- 1.lift cycle ---

- (void)viewDidLoad{
    [super viewDidLoad];
    self.title = @"View3Controller";
    self.view.backgroundColor = [UIColor yellowColor];
    
    self.str = @"View3Controller-str";
//    __weak typeof(self) weakSelf = self;
//    self.block = ^{
//        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(10 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//            NSLog(@"%s %@", __FUNCTION__, weakSelf.str);
//        });
//    };
//    self.block();
    
//    __weak typeof(self) weakSelf = self;
//    self.block = ^{
//        __strong typeof(self) strongSelf = weakSelf;
//        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(10 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//            NSLog(@"%s %@", __FUNCTION__, strongSelf.str);
//        });
//    };
//    self.block();
    
//    @weakify(self);
//    self.block = ^{
//        @strongify(self);
//        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(10 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//             NSLog(@"%s %@", __FUNCTION__, self.str);
//        });
//    };
//    self.block();
    
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

//ClassB是一个UIViewController，假设从ClassA pushViewController将ClassB展示出来
@interface ClassB ()
@property (nonatomic, copy) dispatch_block_t block;
@property (nonatomic, strong) NSString *str;
@end
@implementation ClassB
－ (void)dealloc {
}
－ (void)viewDidLoad {
    [super viewDidLoad];
    self.str = @"111";
    __weak typeof(self) weakSelf = self;
    self.block = ^{
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(10 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            NSLog(@"%@", weakSelf.str);
        });
    };
    self.block();
}

这里会有两种情况：

若从A push到B，10s之内没有pop回A的话，B中block会执行打印出来111。
若从A push到B，10s之内pop回A的话，B会立即执行dealloc，从而导致B中block打印出(null)。这种情况就是使用weakSelf的缺陷，可能会导致内存提前回收。


weakSelf和strongSelf

@interface ClassB ()
@property (nonatomic, copy) dispatch_block_t block;
@property (nonatomic, strong) NSString *str;
@end
@implementation ClassB
－ (void)dealloc {
}
－ (void)viewDidLoad {
    [super viewDidLoad];
    self.str = @"111";
    __weak typeof(self) weakSelf = self;
    self.block = ^{
        __strong typeof(self) strongSelf = weakSelf;
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(10 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            NSLog(@"%@", strongSelf.str);
        });
    };
    self.block();
}

我们发现这样确实解决了问题，但是可能会有两个不理解的点。

这么做和直接用self有什么区别，为什么不会有循环引用：
外部的weakSelf是为了打破环，从而使得没有循环引用，
而内部的strongSelf仅仅是个局部变量，存在栈中，会在block执行结束后回收，不会再造成循环引用。

这么做和使用weakSelf有什么区别：唯一的区别就是多了一个strongSelf，
而这里的strongSelf会使ClassB的对象引用计数＋1，使得ClassB pop到A的时候，并不会执行dealloc，
因为引用计数还不为0，strongSelf仍持有ClassB，而在block执行完，局部的strongSelf才会回收，此时ClassB dealloc。
这样做其实已经可以解决所有问题，但是强迫症的我们依然能找到它的缺陷：

block内部必须使用strongSelf，很麻烦，不如直接使用self简便。
很容易在block内部不小心使用了self，这样还是会引起循环引用，这种错误很难发觉。
不要用NSString和NSNumber测试引用计数 最好使用自定义的class.

3）@weakify和@strongify
查看github上开源的libextobjc库，可以发现，里面的EXTScope.h里面有两个关于weak和strong的宏定义。

// 宏定义
#define weakify(...) \
ext_keywordify \
metamacro_foreach_cxt(ext_weakify_,, __weak, __VA_ARGS__)
#define strongify(...) \
ext_keywordify \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Wshadow\"") \
metamacro_foreach(ext_strongify_,, __VA_ARGS__) \
_Pragma("clang diagnostic pop")

// 用法
@interface ClassB ()
@property (nonatomic, copy) dispatch_block_t block;
@property (nonatomic, strong) NSString *str;
@end
@implementation ClassB
－ (void)dealloc {
}
－ (void)viewDidLoad {
    [super viewDidLoad];
    self.str = @"111";
    @weakify(self)
    self.block = ^{
        @strongify(self)
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(10 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            NSLog(@"%@", self.str);
        });
    };
    self.block();
}

即使写了weak，strong。也得在block里面首先判断strong存在不存在，然后向下进行。
可以看出，这样就完美解决了3中缺陷，我们可以在block中随意使用self。

#endif

