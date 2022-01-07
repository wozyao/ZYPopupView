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

static const CGFloat RowHeight = 50;
static const CGFloat Margin = 100;

@interface ZYViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UIButton *addGoodsBtn;

@property (weak, nonatomic) IBOutlet UIButton *shoppingCartBtn;
/** ZYPopupView */
@property(strong, nonatomic) ZYPopupView *popupView;
/** 购物车数组 */
@property(strong, nonatomic) NSMutableArray<ZYGoodsInfo *> *shoppingCartList;

@end

@implementation ZYViewController

- (NSMutableArray<ZYGoodsInfo *> *)shoppingCartList {
    if (!_shoppingCartList) {
        _shoppingCartList = [NSMutableArray array];
    }
    return _shoppingCartList;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    if (!self.shoppingCartList.count) self.shoppingCartBtn.enabled = NO;
}

- (IBAction)randomBtnDidClick:(UIButton *)sender {
    NSInteger count = arc4random() % 10 + 1;
    [self.shoppingCartList removeAllObjects];
    for (int i=0; i<count; i++) {
        ZYGoodsInfo *goodsInfo = [[ZYGoodsInfo alloc] initWithTitle:[NSString stringWithFormat:@"第%d行", i] num:3];
        [self.shoppingCartList addObject:goodsInfo];
    }
    self.shoppingCartBtn.enabled = YES;
}

- (IBAction)btnDidClick:(UIButton *)sender {
    
    CGFloat width = CGRectGetWidth(self.view.frame);
    CGFloat h = self.shoppingCartList.count * RowHeight + Margin;
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, width, h + RowHeight)];
    ZYHeaderView *headerView = [ZYHeaderView headerView];
    // 清空购物车
    headerView.handleBlock = ^{
        self.shoppingCartBtn.enabled = NO;
        [self.shoppingCartList removeAllObjects];
        [self.popupView dismiss];
    };
    headerView.frame = CGRectMake(0, 0, view.bounds.size.width, RowHeight);
    [view addSubview:headerView];
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, RowHeight, width, h) style:UITableViewStylePlain];
    tableView.dataSource = self;
    tableView.delegate = self;
    tableView.rowHeight = RowHeight;
    tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, Margin)];
    [view addSubview:tableView];
    
    if (self.popupView.isShow) {
        [self.popupView dismiss];
    } else {
        self.popupView = [[ZYPopupView alloc] initWithCustomView:view];
        self.popupView.maximumHeight = 400;
        [self.popupView showInView:self.view];
        [self.view sendSubviewToBack:self.addGoodsBtn];
    }
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.shoppingCartList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ZYShoppingCartCell *cell = [ZYShoppingCartCell cellWithTableView:tableView];
    ZYGoodsInfo *goodsInfo = self.shoppingCartList[indexPath.row];
    cell.goodsInfo = goodsInfo;
    cell.handleBlock = ^(BOOL plus) {
        plus ? goodsInfo.num++ : goodsInfo.num--;
        NSInteger index = [self.shoppingCartList indexOfObject:goodsInfo];
        NSLog(@"行号=%ld，index=%ld，num=%ld", (long)indexPath.row, (long)index, (long)goodsInfo.num);
        NSIndexPath *currentIndexPath = [NSIndexPath indexPathForRow:index inSection:0];
        if (goodsInfo.num > 0) {
            [tableView reloadRowsAtIndexPaths:@[currentIndexPath] withRowAnimation:UITableViewRowAnimationNone];
        } else {
            [self.shoppingCartList removeObject:goodsInfo];
            if (!self.shoppingCartList.count) {
                self.shoppingCartBtn.enabled = NO;
                [self.popupView dismiss];
            }
            [tableView beginUpdates];
            [tableView deleteRowsAtIndexPaths:@[currentIndexPath] withRowAnimation:UITableViewRowAnimationNone];
            [tableView endUpdates];
        }
        
    };
    return cell;
}

@end
