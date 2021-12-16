//
//  ZYViewController.m
//  ZYPopupView
//
//  Created by 东天红iOS on 2021/12/16.
//  Copyright © 2021 com.wozyao. All rights reserved.
//

#import "ZYViewController.h"
#import "ZYPopupView.h"
#import "ZYGoodsInfo.h"
#import "ZYHeaderView.h"
#import "ZYShoppingCartCell.h"

@interface ZYViewController ()<UITableViewDataSource, UITableViewDelegate>

/** ZYPopupView */
@property(strong, nonatomic) ZYPopupView *popupView;
/** 购物车数组 */
@property(strong, nonatomic) NSMutableArray<ZYGoodsInfo *> *shoppingCartList;

@end

@implementation ZYViewController

- (NSMutableArray<ZYGoodsInfo *> *)shoppingCartList {
    if (!_shoppingCartList) {
        _shoppingCartList = [NSMutableArray array];
        for (int i=0; i<5; i++) {
            ZYGoodsInfo *goodsInfo = [[ZYGoodsInfo alloc] initWithTitle:[NSString stringWithFormat:@"第%d行", i] num:3];
            [_shoppingCartList addObject:goodsInfo];
        }
    }
    return _shoppingCartList;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (IBAction)btnDidClick:(UIButton *)sender {
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 300)];
    ZYHeaderView *headerView = [ZYHeaderView headerView];
    CGFloat h = 50;
    headerView.frame = CGRectMake(0, 0, view.bounds.size.width, h);
    [view addSubview:headerView];
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, h, view.bounds.size.width, 300 - h) style:UITableViewStylePlain];
    tableView.dataSource = self;
    tableView.delegate = self;
    tableView.rowHeight = h;
    tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 80)];
    [view addSubview:tableView];
    
    if (self.popupView.isShow) {
        [self.popupView dismiss];
    } else {
        self.popupView = [[ZYPopupView alloc] initWithCustomView:view];
        [self.popupView showInView:self.view];
    }
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.shoppingCartList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ZYShoppingCartCell *cell = [ZYShoppingCartCell cellWithTableView:tableView];
    cell.goodsInfo = self.shoppingCartList[indexPath.row];
    return cell;
}

@end
