//
//  TopViewController.m
//  ChildrenControllerDemo
//
//  Created by WRQ on 2018/2/11.
//  Copyright © 2018年 WRQ. All rights reserved.
//

#import "TopViewController.h"

#define RQScreenWidth [UIScreen mainScreen].bounds.size.width
#define RQScreenHeight [UIScreen mainScreen].bounds.size.height

@interface TopViewController ()

@end

@implementation TopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor redColor];
    self.view.frame = CGRectMake(0, 0, RQScreenWidth, RQScreenHeight - 64);
}

@end
