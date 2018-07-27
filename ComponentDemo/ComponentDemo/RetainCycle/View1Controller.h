//
//  View1Controller.h
//  ComponentDemo
//
//  Created by 沈兆良 on 2018/7/27.
//  Copyright © 2018年 沈兆良. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol View1ControllerDelegate<NSObject>

- (void)view1ControllerClick;
@end

@interface View1Controller : UIViewController


@property (nonatomic, strong) id <View1ControllerDelegate> delegate;
@end

#if 0

ClassA:
@protocol ClassADelegate <NSObject>
－ (void)fuck1;
@end
@interface ClassA : UIViewController
@property (nonatomic, strong) id <ClassADelegate> delegate;
@end

//ClassB:
@interface ClassB ()<ClassADelegate>
@property (nonatomic, strong) ClassA *classA;
@end
@implementation ClassB
－ (void)viewDidLoad{
    [super viewDidLoad];
    self.classA = [[ClassA alloc] init];
    self.classA.delegate = self;
}
@end

如上代码，B强引用A，而A的delegate属性指向B，这里的delegate是用strong修饰的，所以A也会强引用B，这是一个典型的循环引用样例。而解决其的方式大家也都耳熟能详，即将delegate改为弱引用（weak）：
@property (nonatomic, weak) id <ClssADelegate> delegate;

#endif
