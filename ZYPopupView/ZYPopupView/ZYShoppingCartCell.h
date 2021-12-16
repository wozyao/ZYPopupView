//
//  ZYShoppingCartCell.h
//  ZYPopupView
//
//  Created by 东天红iOS on 2021/12/16.
//  Copyright © 2021 com.wozyao. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ZYGoodsInfo;

NS_ASSUME_NONNULL_BEGIN

@interface ZYShoppingCartCell : UITableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView;
/** 商品信息 */
@property(strong, nonatomic) ZYGoodsInfo *goodsInfo;

@end

NS_ASSUME_NONNULL_END
