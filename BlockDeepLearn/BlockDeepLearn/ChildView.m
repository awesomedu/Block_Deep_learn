//
//  ChildView.m
//  BlockDeepLearn
//
//  Created by mac on 2019/1/24.
//  Copyright © 2019年 mac. All rights reserved.
//

#import "ChildView.h"

@interface ChildView ()
@property (nonatomic, strong) UIButton *btn;

@end

@implementation ChildView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setUpUI];
    }
    return self;
}

- (void)setUpUI{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.backgroundColor = [UIColor redColor];
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    self.btn = btn;
    [self addSubview:self.btn];
}

- (void)btnClick{
    NSLog(@"child click");
    if (self.childBlock) {
        self.childBlock(self);
    }
}

- (void)layoutSubviews{
    self.btn.frame = self.bounds;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
