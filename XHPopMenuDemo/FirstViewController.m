//
//  FirstViewController.m
//  XHPopMenu
//
//  Created by chengxianghe on 16/4/6.
//  Copyright © 2016年 cn. All rights reserved.
//

#import "FirstViewController.h"
#import "XHPopMenu.h"

@interface FirstViewController ()

@property (nonatomic, strong) XHPopMenuItem *lastModel;
@property (nonatomic, strong) NSMutableArray *dataArray;

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)leftItemClick:(UIButton *)sender {

    NSMutableArray *tempArr = [NSMutableArray array];
    NSArray *titleArr = @[@"扫一扫", @"加好友", @"创建讨论组", @"发送到电脑", @"面对面快传", @"收钱"];
    for (int i = 1; i < titleArr.count; i++) {
        XHPopMenuItem *model = [[XHPopMenuItem alloc] initWithTitle:titleArr[i - 1] image:[UIImage imageNamed:[NSString stringWithFormat:@"menu_%d",i]] block:^(XHPopMenuItem *item) {
            NSLog(@"block:%@",item);
        }];
        
        [tempArr addObject:model];
    }
    
    XHPopMenuConfiguration *options = [XHPopMenuConfiguration defaultConfiguration];
    options.style            = XHPopMenuAnimationStyleWeiXin;
    options.marginXSpacing   = 15;//MenuItem左右边距
    options.marginYSpacing   = 8;//MenuItem上下边距
    options.intervalSpacing  = 10;// MenuItemImage与MenuItemTitle的间距
    options.itemHeight       = 40;
    options.itemMaxWidth     = 140;
    options.arrowSize        = 9;//指示箭头大小
    options.arrowMargin      = 10;// 手动设置箭头和目标view的距离
    options.menuCornerRadius = 3;//菜单圆角半径
    options.titleColor       = [UIColor whiteColor];//menuItem字体颜色

    [XHPopMenu showMenuWithView:sender menuItems:tempArr withOptions:options];
}

- (IBAction)onButtonClick:(UIButton *)sender {
    XHPopMenuConfiguration *options = [XHPopMenuConfiguration defaultConfiguration];
    options.style               = XHPopMenuAnimationStyleScale;
    options.menuMaxHeight       = 240; // 菜单最大高度
    options.itemHeight          = 40;
    options.itemMaxWidth        = 140;
    options.arrowSize           = 15; //指示箭头大小
    options.arrowMargin         = 0; // 手动设置箭头和目标view的距离
    options.marginXSpacing      = 10; //MenuItem左右边距
    options.marginYSpacing      = 9; //MenuItem上下边距
    options.intervalSpacing     = 15; //MenuItemImage与MenuItemTitle的间距
    options.menuCornerRadius    = 3; //菜单圆角半径
    options.shadowOfMenu        = YES; //是否添加菜单阴影
    options.hasSeparatorLine    = YES; //是否设置分割线
    options.separatorInsetLeft  = 10; //分割线左侧Insets
    options.separatorInsetRight = 0; //分割线右侧Insets
    options.separatorHeight     = 1.0 / [UIScreen mainScreen].scale;//分割线高度
    options.titleColor          = [UIColor redColor];//menuItem字体颜色
    options.separatorColor      = [UIColor whiteColor];//分割线颜色
    options.menuBackgroundColor = [UIColor colorWithWhite:0.8 alpha:1],//菜单的底色
    options.selectedColor       = [UIColor grayColor];// menuItem选中颜色

    [XHPopMenu showMenuInView:self.view withView:sender menuItems:self.dataArray withOptions:options];
}
- (IBAction)onSwich:(UISwitch *)sender {
    if (sender.on) {
        self.lastModel.title = @"哈哈哈";
    } else {
        self.lastModel.title = @"收钱";
    }
}

- (void)popMenuView:(XHPopMenu *)menu{
    NSLog(@"%@",menu);
}

- (NSMutableArray *)dataArray {
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
        NSArray *titleArr = @[@"扫一扫", @"加好友", @"创建讨论组", @"发送到电脑", @"面对面快传", @"收钱", @"扫一扫", @"加好友"];
        for (int i = 1; i <= titleArr.count; i++) {
            XHPopMenuItem *model = [[XHPopMenuItem alloc] initWithTitle:titleArr[i - 1] image:[UIImage imageNamed:[NSString stringWithFormat:@"menu_%d",i % 6 + 1]] block:^(XHPopMenuItem *item) {
                NSLog(@"block:%@",item);
            }];
            [_dataArray addObject:model];
        }
        
        self.lastModel = _dataArray.lastObject;
    }
    return _dataArray;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
