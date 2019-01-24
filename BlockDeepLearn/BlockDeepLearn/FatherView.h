//
//  FatherView.h
//  BlockDeepLearn
//
//  Created by mac on 2019/1/24.
//  Copyright © 2019年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN


@interface FatherView : UIView
@property (nonatomic, copy) void(^fatherBlock)(UIView *view);


@end

NS_ASSUME_NONNULL_END
