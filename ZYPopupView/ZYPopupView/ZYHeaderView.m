//
//  ZYHeaderView.m
//  ZYPopupView
//
//  Created by 东天红iOS on 2021/12/16.
//  Copyright © 2021 com.wozyao. All rights reserved.
//

#import "ZYHeaderView.h"

@interface ZYHeaderView ()

@end

@implementation ZYHeaderView

+ (instancetype)headerView {
    ZYHeaderView *headerView = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] lastObject];
    return headerView;
}

@end
