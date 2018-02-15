//
//  SocietyViewController.m
//  ChildrenControllerDemo
//
//  Created by WRQ on 2018/2/11.
//  Copyright © 2018年 WRQ. All rights reserved.
//

#import "SocietyViewController.h"

#define RQScreenWidth [UIScreen mainScreen].bounds.size.width
#define RQScreenHeight [UIScreen mainScreen].bounds.size.height

@interface SocietyViewController ()

@end

@implementation SocietyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor yellowColor];
    self.view.frame = CGRectMake(RQScreenWidth * 3, 0, RQScreenWidth, RQScreenHeight - 64);
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
