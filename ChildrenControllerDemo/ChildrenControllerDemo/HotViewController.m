//
//  HotViewController.m
//  ChildrenControllerDemo
//
//  Created by WRQ on 2018/2/11.
//  Copyright © 2018年 WRQ. All rights reserved.
//

#import "HotViewController.h"

#define RQScreenWidth [UIScreen mainScreen].bounds.size.width
#define RQScreenHeight [UIScreen mainScreen].bounds.size.height

@interface HotViewController ()

@end

@implementation HotViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor greenColor];
    self.view.frame = CGRectMake(RQScreenWidth * 1, 0, RQScreenWidth, RQScreenHeight - 64);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"%s",__func__);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
