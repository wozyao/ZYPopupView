//
//  ZYGoodsInfo.m
//  ZYPopupView
//
//  Created by 东天红iOS on 2021/12/16.
//  Copyright © 2021 com.wozyao. All rights reserved.
//

#import "ZYGoodsInfo.h"

@implementation ZYGoodsInfo

- (instancetype)initWithTitle:(NSString *)title num:(NSInteger)num {
    if (self = [super init]) {
        _title = title;
        _num = num;
    }
    return self;
}

@end
