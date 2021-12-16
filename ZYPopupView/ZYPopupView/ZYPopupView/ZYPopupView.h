//
//  ZYPopupView.h
//  ZYPopupView
//
//  Created by 东天红iOS on 2021/12/16.
//  Copyright © 2021 com.wozyao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZYPopupView : UIView

- (instancetype)initWithCustomView:(UIView *)customView;

/** 头部左右圆角，默认10 */
@property(assign, nonatomic) CGFloat cornerRadius;
/** 蒙版透明度，默认0.5 */
@property(assign, nonatomic) CGFloat alpha;
/** 当前显示状态，默认隐藏 */
@property(assign, nonatomic) BOOL isShow;
/** 最大高度，默认默认与customView的高度一致 */
@property(assign, nonatomic) CGFloat maximumHeight;

/** 在view上展示ZYPopupView */
- (void)showInView:(UIView *)view;
/** 在主窗口展示ZYPopupView */
- (void)show;
/** 隐藏ZYPopupView */
- (void)dismiss;

@end

NS_ASSUME_NONNULL_END
