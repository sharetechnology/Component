//
//  ViewController.m
//  ComponentDemo
//
//  Created by 沈兆良 on 2018/7/26.
//  Copyright © 2018年 沈兆良. All rights reserved.
//

#import "ViewController.h"
#import "SharedInstanceObj.h"
#import "MailViewController.h"
#import <FBRetainCycleDetector/FBRetainCycleDetector.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [SharedInstanceObj deallocShared];
}

- (IBAction)gotoMailVC:(UIButton *)sender {
    MailViewController *vc = MailViewController.new;
    FBRetainCycleDetector *detector = [FBRetainCycleDetector new];
    [detector addCandidate:vc];
    NSSet *retainCycles = [detector findRetainCycles];
    NSLog(@"%@", retainCycles);
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
