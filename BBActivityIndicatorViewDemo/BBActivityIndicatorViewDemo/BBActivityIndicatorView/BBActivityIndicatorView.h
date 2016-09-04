//
//  BBActivityIndicatorView.h
//  按钮加载动画
//
//  Created by zhiwei on 16/9/4.
//  Copyright © 2016年 zhiwei. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface BBActivityIndicatorView : UIView


+(_Nonnull instancetype)defaultIndicator;

@property(nonatomic) BOOL hidesWhenStopped;

- (void)startAnimating;
- (void)stopAnimating;
- (BOOL)isAnimating;


@end
