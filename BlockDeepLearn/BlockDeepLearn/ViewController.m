//
//  ViewController.m
//  BlockDeepLearn
//
//  Created by mac on 2019/1/24.
//  Copyright © 2019年 mac. All rights reserved.
//

typedef int(^MethodBlock)(int a,int b);

#import "ViewController.h"
#import "FatherView.h"

@interface ViewController ()
{
    int _global;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    ///1. block 赋值
    void (^blockName)(int param);
    
    blockName = ^(int a){
        NSLog(@"param = %d",a);
    };
    
    blockName(10086);
    
    ///2. typedef 定义block
    typedef void(^Hello)(void);
    Hello hello;
    hello = ^(){
        NSLog(@"hello");
    };
    hello();
    
    ///3.
    [self useBlockForMethod:^int(int a, int b) {
        return a + b;
    }];
    
    ///4.声明并赋值一个block
    MethodBlock mBlock = ^(int x , int y){
        return x + y;
    };
    
    [self useBlockForMethod:mBlock];
    
    ///5.block 局部变量修改(1)
    int a = 100;
    void (^myBlock)(void) = ^{
        NSLog(@"a = %d",a);  /// a = 100;
    };
    
    a = 101;
    myBlock();
    ///block 局部变量修改(2)
    /*
    int b = 100;
    
    void(^myBlock2)(void) = ^{
        b ++; // 这句报错  block 不可修改局部变量
        NSLog(@"b = %d", b);
    };
    // 调用后控制台输出"a = 100"
    myBlock2();
     */
    
    ///block 可以访问全局变量
    _global = 100; // 声明全局变量global
    
    void(^myBlock3)(void) = ^{
        NSLog(@"global = %d", _global);
    };
    _global = 101;
    // 调用后控制台输出"global = 101"
    myBlock3();
    
    /// test
    FatherView *fV = [[FatherView alloc] init];
    fV.frame = CGRectMake(200, 200, 200, 200);
    fV.fatherBlock = ^(UIView * _Nonnull view) {
        view.backgroundColor = [UIColor greenColor];
    };
    [self.view addSubview:fV];
    
}

/// block 作为函数参数
- (void)useBlockForMethod:(MethodBlock)aBlock{
    NSLog(@"result = %d",aBlock(300,200));
}



@end
