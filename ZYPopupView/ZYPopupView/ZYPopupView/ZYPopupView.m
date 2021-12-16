//
//  ZYPopupView.m
//  ZYPopupView
//
//  Created by 东天红iOS on 2021/12/16.
//  Copyright © 2021 com.wozyao. All rights reserved.
//

#import "ZYPopupView.h"

#define Screen_Width [UIScreen mainScreen].bounds.size.width
#define Screen_Height [UIScreen mainScreen].bounds.size.height

static const NSTimeInterval Duration_Interval = 0.3;

@interface ZYPopupView ()

/** 父View */
//@property(weak, nonatomic) UIView *superView;
/** 浅黑色蒙版 */
@property(weak, nonatomic) UIView *maskView;

@end

@implementation ZYPopupView

- (instancetype)initWithCustomView:(UIView *)customView {
    if (self = [super init]) {
        self.cornerRadius = 10;
        self.alpha = 0.5;
        self.maximumHeight = customView.bounds.size.height;
        self.frame = customView.bounds;
        self.backgroundColor = [UIColor whiteColor];
        UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:UIRectCornerAllCorners cornerRadii:CGSizeMake(self.cornerRadius, self.cornerRadius)];
        CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
        maskLayer.frame = self.bounds;
        maskLayer.path = maskPath.CGPath;
        self.layer.mask = maskLayer;
        [self addSubview:customView];
    }
    return self;
}

- (void)setAlpha:(CGFloat)alpha {
    _alpha = alpha;
}

- (void)setMaximumHeight:(CGFloat)maximumHeight {
    _maximumHeight = maximumHeight;
//    CGRect rect = self.frame;
//    rect.size.height = maximumHeight;
//    self.frame = rect;
}

- (void)showInView:(UIView *)view {
    self.isShow = YES;
    UIView *maskView = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    maskView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:self.alpha];
    maskView.alpha = 0;
    UITapGestureRecognizer *tapGR = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismiss)];
    [maskView addGestureRecognizer:tapGR];
    [view addSubview:maskView];
    self.maskView = maskView;
    [view addSubview:self];

    self.transform = CGAffineTransformMakeTranslation(0, view.bounds.size.height);
    [UIView animateWithDuration:Duration_Interval animations:^{
        self.transform = CGAffineTransformMakeTranslation(0, view.bounds.size.height - self.bounds.size.height);
        maskView.alpha = 1;
    }];
}

- (void)show {
    [self showInView:[UIApplication sharedApplication].delegate.window];
}

- (void)dismiss {
    self.isShow = NO;
    [UIView animateWithDuration:Duration_Interval animations:^{
        self.transform = CGAffineTransformMakeTranslation(0, Screen_Height);
        self.maskView.alpha = 0;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
        [self.maskView removeFromSuperview];
    }];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [self.superview sendSubviewToBack:self];
    [self.superview sendSubviewToBack:self.maskView];
    
}

@end