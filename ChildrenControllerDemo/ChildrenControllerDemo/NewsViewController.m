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

@interface NewsViewController ()<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *topScrollView;
@property (weak, nonatomic) IBOutlet UIScrollView *contentScrollView;
/** 之前选中的按钮 */
@property(nonatomic, strong) UILabel *preLabel;
/** 标题数组 */
@property(nonatomic, strong) NSMutableArray *titileArray;


@end

@implementation NewsViewController

#pragma mark - 视图生命周期
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
        label.highlightedTextColor = [UIColor redColor];
        label.textAlignment = NSTextAlignmentCenter;
        label.userInteractionEnabled = YES;
        
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickTitleWithTap:)];
        [label addGestureRecognizer:tapGesture];
        
        label.tag = i;
        
        if (i == 0) {
            [self clickTitleWithLabel:label];
        }
        
        [self.titileArray addObject:label];
        
        [self.topScrollView addSubview:label];
    }
}

- (void)scrollToPointWithLabel:(UILabel *)label {
    NSInteger index = label.tag;
    
    self.contentScrollView.contentOffset = CGPointMake(index * self.contentScrollView.bounds.size.width, 0);
    
    UIViewController *vc = self.childViewControllers[index];
    [self.contentScrollView addSubview:vc.view];
}

- (void)clickTitleWithTap:(UITapGestureRecognizer *)tap {
    // 获取View
    UILabel *label = (UILabel *)tap.view;
    
    // 选中按钮
    [self clickTitleWithLabel:label];
}

- (void)clickTitleWithLabel:(UILabel *)label {
    // 选中按钮
    [self selectTitleWithLabel:label];
    
    // contentView滚动到相应位置
    [self scrollToPointWithLabel:label];
    
    // titleView滚动到相应位置
    [self scrollTitleWithLabel:label];
}

- (void)selectTitleWithLabel:(UILabel *)label {
    _preLabel.highlighted = NO;
    _preLabel.transform = CGAffineTransformIdentity;
    _preLabel.textColor = [UIColor blackColor];
    label.highlighted = YES;
    label.transform = CGAffineTransformMakeScale(1.3, 1.3);
    _preLabel = label;
}

- (void)scrollTitleWithLabel:(UILabel *)label {
    CGFloat offsetX = label.center.x - RQScreenWidth * 0.5;
    CGFloat maxOffsetX = self.topScrollView.contentSize.width - RQScreenWidth;
    if (offsetX < 0) {
        offsetX = 0;
    }else if(offsetX > maxOffsetX) {
        offsetX = maxOffsetX;
    }
    [self.topScrollView setContentOffset:CGPointMake(offsetX, 0) animated:YES];
}

- (CGFloat)getPage {
    return self.contentScrollView.contentOffset.x / self.contentScrollView.bounds.size.width;
}

#pragma mark - 懒加载控件
- (NSMutableArray *)titileArray {
    if (!_titileArray) {
        _titileArray = [NSMutableArray array];
    }
    
    return _titileArray;
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    NSInteger index = [self getPage];
    
    // 获取Label
    UILabel *label = self.titileArray[index];
    // 选中Label
    [self clickTitleWithLabel:label];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat page = [self getPage];
    NSInteger leftIndex = [self getPage];
    NSInteger rightIndex = leftIndex + 1;
    
    if (rightIndex == _titileArray.count) {
        return;
    }
    
    CGFloat rightScale = page - leftIndex;
    CGFloat leftScale = 1 - rightScale;
    
    UILabel *leftLabel = _titileArray[leftIndex];
    UILabel *rightLabel = _titileArray[rightIndex];
    
    leftLabel.transform = CGAffineTransformMakeScale(leftScale * 0.3 + 1, leftScale * 0.3 + 1);
    leftLabel.textColor = [UIColor colorWithRed:leftScale green:0 blue:0 alpha:1.0];
    rightLabel.transform = CGAffineTransformMakeScale(rightScale * 0.3 + 1, rightScale * 0.3 + 1);
    rightLabel.textColor = [UIColor colorWithRed:rightScale green:0 blue:0 alpha:1.0];
}

- (void)setupScrollview {
    self.topScrollView.contentSize = CGSizeMake(self.childViewControllers.count * titleWidth, 0);
    self.topScrollView.showsHorizontalScrollIndicator = NO;
    
    self.contentScrollView.contentSize = CGSizeMake(RQScreenWidth * self.childViewControllers.count, 0);
    self.contentScrollView.pagingEnabled = YES;
    self.contentScrollView.delegate = self;
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
