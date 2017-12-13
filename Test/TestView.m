//
//  TestView.m
//  Test
//
//  Created by cy on 2017/12/14.
//  Copyright © 2017年 teemo. All rights reserved.
//

#import "TestView.h"

@implementation TestView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setupUI];
    }
    return self;
}
- (void)setupUI {
    self.backgroundColor = [UIColor whiteColor];
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    btn.userInteractionEnabled = YES;
    [btn setTitle:@"点击" forState:normal];
    [self addSubview:btn];
    [btn setTitleColor:[UIColor blueColor] forState:normal];
    [btn addTarget:self action:@selector(onClick) forControlEvents:UIControlEventTouchUpInside];
}
- (void)onClick {
    NSLog(@"123");
    if (self.closeActionBlock) {
        self.closeActionBlock();
    }
}
@end
