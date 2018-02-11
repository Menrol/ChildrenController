//
//  NewsViewController.m
//  ChildrenControllerDemo
//
//  Created by WRQ on 2018/2/10.
//  Copyright © 2018年 WRQ. All rights reserved.
//

#import "NewsViewController.h"
#import "TopViewController.h"
#import "HotViewController.h"
#import "VedioViewController.h"
#import "SocietyViewController.h"
#import "SubscribeViewController.h"
#import "ScienceViewController.h"

#define RQScreenWidth [UIScreen mainScreen].bounds.size.width
#define RQScreenHeight [UIScreen mainScreen].bounds.size.height

static CGFloat const titleWidth = 100;

@interface NewsViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *topScrollView;
@property (weak, nonatomic) IBOutlet UIScrollView *contentScrollView;

@end

@implementation NewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self addChildViewControllers];
    
    [self addTitle];
    
    [self setupScrollview];
}

- (void)addTitle {
    NSUInteger count = self.childViewControllers.count;
    
    CGFloat offsetX = 0;
    for (int i = 0; i < count; i++) {
        UILabel *label = [[UILabel alloc] init];
        offsetX = i * titleWidth;
        label.frame = CGRectMake(offsetX, 0, titleWidth, self.topScrollView.bounds.size.height);
        
        UIViewController *vc = self.childViewControllers[i];
        label.text = vc.title;
        
        label.textAlignment = NSTextAlignmentCenter;
        
        label.userInteractionEnabled = YES;
        
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickTitleWithTap:)];
        [label addGestureRecognizer:tapGesture];
        
        [self.topScrollView addSubview:label];
    }
}

- (void)clickTitleWithTap:(UITapGestureRecognizer *)tap {
    NSLog(@"%s",__func__);
}

- (void)setupScrollview {
    self.topScrollView.contentSize = CGSizeMake(self.childViewControllers.count * titleWidth, 0);
    self.topScrollView.showsHorizontalScrollIndicator = NO;
}

- (void)addChildViewControllers {
    // 头条
    TopViewController *topVC = [[TopViewController alloc] init];
    topVC.title = @"头条";
    [self addChildViewController:topVC];
    
    // 热点
    HotViewController *hotVC = [[HotViewController alloc] init];
    hotVC.title = @"热点";
    [self addChildViewController:hotVC];
    
    // 视频
    VedioViewController *vedioVC = [[VedioViewController alloc] init];
    vedioVC.title = @"视频";
    [self addChildViewController:vedioVC];
    
    // 社会
    SocietyViewController *societyVC = [[SocietyViewController alloc] init];
    societyVC.title = @"社会";
    [self addChildViewController:societyVC];
    
    // 订阅
    SubscribeViewController *subscribeVC = [[SubscribeViewController alloc] init];
    subscribeVC.title = @"订阅";
    [self addChildViewController:subscribeVC];
    
    // 科学
    ScienceViewController *scienceVC = [[ScienceViewController alloc] init];
    scienceVC.title = @"科学";
    [self addChildViewController:scienceVC];
}


@end
