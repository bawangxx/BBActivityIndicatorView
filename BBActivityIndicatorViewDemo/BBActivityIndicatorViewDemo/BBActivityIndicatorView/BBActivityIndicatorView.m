//
//  BBActivityIndicatorView.m
//  按钮加载动画
//
//  Created by zhiwei on 16/9/4.
//  Copyright © 2016年 zhiwei. All rights reserved.
//

#import "BBActivityIndicatorView.h"

@interface BBActivityIndicatorView()

@property (nonatomic,strong) UIImageView *indicatorImageView;
@property (nonatomic, readwrite) BOOL isAnimating;


@end

@implementation BBActivityIndicatorView

+(instancetype)defaultIndicator{
    
   return [[self alloc] initWithFrame:CGRectZero];
    
}


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initialize];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        [self initialize];
    }
    return self;
}



-(void)initialize{
    
    self.backgroundColor = [UIColor clearColor];
    [self addSubview:self.indicatorImageView];
}

-(void)layoutSubviews{
    
    [super layoutSubviews];
    
    self.indicatorImageView.frame = CGRectMake(-10, -10, 20, 20);

}



-(UIImageView *)indicatorImageView{
    
    if (!_indicatorImageView) {
        
        _indicatorImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"BBActivityIndicatorView.bundle/loading_video_details"]];
    }
    return _indicatorImageView;
}



- (void)startAnimating{
    
    if (self.isAnimating)
        return;
    
    CABasicAnimation* rotationAnimation;
    rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.toValue = [NSNumber numberWithFloat: M_PI * 2.0 ];
    rotationAnimation.duration = 0.5;
    rotationAnimation.cumulative = YES;
    rotationAnimation.repeatCount = MAXFLOAT;
    
    [_indicatorImageView.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
    
    self.isAnimating = true;
    
    if (self.hidesWhenStopped) {
        self.hidden = NO;
    }
    
}
- (void)stopAnimating{
    
    if (!self.isAnimating)
        return;
    
    [self.indicatorImageView.layer removeAllAnimations];
    
    self.isAnimating = false;
    
    if (self.hidesWhenStopped) {
        self.hidden = YES;
    }
    
}


- (BOOL)isAnimating{
    return _isAnimating;
}

- (void)setHidesWhenStopped:(BOOL)hidesWhenStopped {
    _hidesWhenStopped = hidesWhenStopped;
    self.hidden = !self.isAnimating && hidesWhenStopped;
}


@end
