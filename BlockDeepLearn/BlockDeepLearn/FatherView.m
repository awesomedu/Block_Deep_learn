//
//  FatherView.m
//  BlockDeepLearn
//
//  Created by mac on 2019/1/24.
//  Copyright © 2019年 mac. All rights reserved.
//

#import "FatherView.h"
#import "ChildView.h"


@interface FatherView ()
@property (nonatomic, strong) UIButton *btn;
@property (nonatomic, strong) ChildView *cv;

@end

@implementation FatherView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setUpUI];
    }
    return self;
}

- (void)setUpUI{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.backgroundColor = [UIColor cyanColor];
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    self.btn = btn;
    [self addSubview:self.btn];
    
    ChildView *cV = [[ChildView alloc] init];
    self.cv = cV;
    cV.backgroundColor = [UIColor brownColor];
    [self addSubview:cV];
}

- (void)btnClick{
    NSLog(@"father click");
    
//    self.cv.childBlock = ^(UIView * _Nonnull view) {
//        view.backgroundColor = [UIColor redColor];
//    };
//    if (self.fatherBlock) {
//        self.fatherBlock(self);
//    }
    __weak typeof(self)weakSelf = self;
    self.cv.childBlock = ^(UIView * _Nonnull view) {
        if (weakSelf.fatherBlock) {
            weakSelf.fatherBlock(view);
        }
    };
}

- (void)layoutSubviews{
    self.btn.frame = self.bounds;
    CGRect framec = self.bounds;
    self.cv.frame = CGRectMake(framec.origin.x + 50, framec.origin.y + 50, framec.size.width - 100, framec.size.height - 100);
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
