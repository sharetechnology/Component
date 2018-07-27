//
//  View0Controller.m
//  ComponentDemo
//
//  Created by 沈兆良 on 2018/7/26.
//  Copyright © 2018年 沈兆良. All rights reserved.
//

#import "View0Controller.h"
#import "SharedInstanceObj.h"
#import "View1Controller.h"
#import "View2Controller.h"
#import "View3Controller.h"
@interface View0Controller ()<View1ControllerDelegate>
/** <##> */
@property(nonatomic, strong)View1Controller *vc1;
/** <##> */
@property(nonatomic, strong)View2Controller *vc2;
/** <##> */
@property(nonatomic, strong)View3Controller *vc3;
@end

@implementation View0Controller

- (void)viewDidLoad {
    [super viewDidLoad];
    [SharedInstanceObj sharedInstance];
    self.title = @"View0Controller";
    
    UIBarButtonItem *vc1Item = [[UIBarButtonItem alloc] initWithTitle:@"vc1Item" style:UIBarButtonItemStylePlain target:self action:@selector(gotoVC1)];
    UIBarButtonItem *vc2Item = [[UIBarButtonItem alloc] initWithTitle:@"vc2Item" style:UIBarButtonItemStylePlain target:self action:@selector(gotoVC2)];
    UIBarButtonItem *vc3Item = [[UIBarButtonItem alloc] initWithTitle:@"vc3Item" style:UIBarButtonItemStylePlain target:self action:@selector(gotoVC3)];
    
    self.navigationItem.rightBarButtonItems = @[vc1Item, vc2Item, vc3Item];

}

- (void)dealloc{
    NSLog(@"%s %@", __FUNCTION__, self);
}


- (void)view1ControllerClick{
    NSLog(@"%s %@", __FUNCTION__, self);
}

- (void)gotoVC1{
    [self.navigationController pushViewController:self.vc1 animated:YES];
}

- (void)gotoVC2{
    [self.navigationController pushViewController:self.vc2 animated:YES];
}

- (void)gotoVC3{
    [self.navigationController pushViewController:self.vc3 animated:YES];
}

- (View1Controller *)vc1{
    if (!_vc1) {
        _vc1 = [[View1Controller alloc]init];
        _vc1.delegate = self;
    }
    return _vc1;
}

- (View2Controller *)vc2{
    if (!_vc2) {
        _vc2 = [[View2Controller alloc]init];
    }
    return _vc2;
}

- (View3Controller *)vc3{
    if (!_vc3) {
        _vc3 = [[View3Controller alloc]init];
    }
    return _vc3;
}
//- (BOOL)willDealloc {
//    NSLog(@"%s %@", __FUNCTION__, self);
//    return NO;
//}

@end


