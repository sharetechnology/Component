//
//  ViewController.m
//  ComponentDemo
//
//  Created by 沈兆良 on 2018/7/26.
//  Copyright © 2018年 沈兆良. All rights reserved.
//

#import "ViewController.h"
#import "SharedInstanceObj.h"

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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
