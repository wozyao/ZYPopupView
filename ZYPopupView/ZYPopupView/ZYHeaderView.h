//
//  ZYHeaderView.h
//  ZYPopupView
//
//  Created by 东天红iOS on 2021/12/16.
//  Copyright © 2021 com.wozyao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZYHeaderView : UIView

+ (instancetype)headerView;

/** 清空购物车 */
@property (copy, nonatomic) void (^handleBlock)(void);

@end

NS_ASSUME_NONNULL_END
