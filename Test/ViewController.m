//
//  ViewController.m
//  Test
//
//  Created by cy on 2017/12/13.
//  Copyright © 2017年 teemo. All rights reserved.
//

#import "ViewController.h"
#import "ZJAnimationPopView.h"
#import "TestView.h"
@interface ViewController () {
    id _customView;
    TestView *_testView;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    [btn setTitle:@"点击" forState:normal];
    [self.view addSubview:btn];
    [btn setTitleColor:[UIColor blueColor] forState:normal];
    [btn addTarget:self action:@selector(onClick) forControlEvents:UIControlEventTouchUpInside];
}

- (void)onClick {
    
    _testView = [[TestView alloc] initWithFrame:CGRectMake(50, 200, 200, 300)];
    _customView = _testView;

    ZJAnimationPopStyle popStyle = ZJAnimationPopStyleShakeFromTop;
    ZJAnimationDismissStyle dismissStyle = ZJAnimationDismissStyleDropToTop;
    ZJAnimationPopView *popView = [[ZJAnimationPopView alloc] initWithCustomView:_testView popStyle:popStyle dismissStyle:dismissStyle];
    
    //popView.isClickBGDismiss = ![_customView isKindOfClass:[_testView class]];
    _testView.closeActionBlock = ^{
        [popView dismiss];
    };
    // 2.2 显示时背景的透明度
    popView.popBGAlpha = 0.5f;
    // 2.3 显示时是否监听屏幕旋转
    popView.isObserverOrientationChange = YES;
    // 2.6 显示完成回调
    popView.popComplete = ^{
        NSLog(@"显示完成");
    };
    // 2.7 移除完成回调
    popView.dismissComplete = ^{
        NSLog(@"移除完成");
    };
    
    // 3.处理自定义视图操作事件
    //[self handleCustomActionEnvent:popView];
    
    // 4.显示弹框
    [popView pop];
}
#pragma mark 处理自定义视图操作事件
- (void)handleCustomActionEnvent:(ZJAnimationPopView *)popView
{
    __weak typeof(popView) weakPopView = popView;
    // 在监听自定义视图的block操作事件时，要使用弱对象来避免循环引用
    _testView = [[TestView alloc] initWithFrame:CGRectMake(50, 200, 200, 300)];
    _customView = _testView;
    _testView.closeActionBlock = ^{
        [popView dismiss];
    };
}

@end
