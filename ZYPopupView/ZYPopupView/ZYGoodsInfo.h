//
//  ZYGoodsInfo.h
//  ZYPopupView
//
//  Created by 东天红iOS on 2021/12/16.
//  Copyright © 2021 com.wozyao. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZYGoodsInfo : NSObject

/** 商品名称 */
@property(copy, nonatomic) NSString *title;
/** 商品数量 */
@property(assign, nonatomic) NSInteger num;

- (instancetype)initWithTitle:(NSString *)title num:(NSInteger)num;

@end

NS_ASSUME_NONNULL_END
