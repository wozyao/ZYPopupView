//
//  ZYShoppingCartCell.m
//  ZYPopupView
//
//  Created by 东天红iOS on 2021/12/16.
//  Copyright © 2021 com.wozyao. All rights reserved.
//

#import "ZYShoppingCartCell.h"
#import "ZYGoodsInfo.h"

@interface ZYShoppingCartCell ()

@property (weak, nonatomic) IBOutlet UILabel *goodsTitleLabel;
@property (weak, nonatomic) IBOutlet UIButton *minusBtn;
@property (weak, nonatomic) IBOutlet UILabel *numLabel;
@property (weak, nonatomic) IBOutlet UIButton *plusBtn;

@end

@implementation ZYShoppingCartCell

+ (instancetype)cellWithTableView:(UITableView *)tableView {
    ZYShoppingCartCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(self)];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] lastObject];
    }
    return cell;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setGoodsInfo:(ZYGoodsInfo *)goodsInfo {
    _goodsInfo = goodsInfo;
    self.goodsTitleLabel.text = goodsInfo.title;
    self.numLabel.text = [NSString stringWithFormat:@"%ld", (long)goodsInfo.num];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
