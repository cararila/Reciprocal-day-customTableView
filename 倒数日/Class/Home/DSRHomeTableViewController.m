//
//  DSRHomeTableViewController.m
//  倒数日
//
//  Created by 马婷婷 on 15/8/13.
//  Copyright © 2015年 Cara. All rights reserved.
//

#import "DSRHomeTableViewController.h"
#import "DSRTableViewCell.h"
#import "DSRHome.h"
#import "DSDownMenu.h"
#import "DSMenuItem.h"
#import "DSRHomeTableViewController.h"
#import "DSRAddHeaderTableViewCell.h"
#import "DSRAddViewController.h"
@interface DSRHomeTableViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong) NSMutableArray *deals;
/** downMenu*/
@property (nonatomic,strong) DSDownMenu *downMenu;

/** model*/
@property (nonatomic,strong) DSRTableViewCell *dsrCell;

@property (nonatomic, assign) BOOL isPopMenu;


@end

@implementation DSRHomeTableViewController
- (NSArray *)deals{
    if (!_deals) {
        _deals =[NSMutableArray array];
    }
    
    return _deals;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.delegate =self;
    self.tableView.dataSource =self;
    [self setupNav];
    [self setupTitle];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}
- (void)setupTitle{
    NSArray *s =@[@"倒数日"];
    UISegmentedControl *sc= [[UISegmentedControl alloc ]initWithItems:s];
    sc.selectedSegmentIndex =0;
    sc.tintColor =[UIColor clearColor];
    NSDictionary *attributes =@{
                                NSFontAttributeName:[UIFont boldSystemFontOfSize:25],
                                NSForegroundColorAttributeName:[UIColor whiteColor]
                                };
    
    [sc setTitleTextAttributes:attributes forState:UIControlStateNormal];
    self.navigationItem.titleView =sc;

}
- (void)setupNav{
    self.navigationItem.title =@"倒数日";
    /**左侧 barbuttonitem*/
    self.navigationItem.leftBarButtonItem =[UIBarButtonItem itemWithImage:@"btn_hamburger_nor" selImage: @"btn_wrong_sel" target:self action:@selector(click)];
    /**右侧 barbuttonitem*/
    UIBarButtonItem *oneItem =[UIBarButtonItem itemWithImage:@"btn_add_nor" selImage: @"btn_add_sel" target:self action:@selector(add)];
    UIBarButtonItem *twoItem =[UIBarButtonItem itemWithImage:@"btn_edit_nor" selImage: @"btn_edit_sel" target:self action:@selector(addNew)];
    self.navigationItem.rightBarButtonItems =@[oneItem,twoItem];
}
- (void)addNew{
    DSRAddViewController *add =[[DSRAddViewController alloc] init];
    
    [self.navigationController pushViewController:add animated:YES];
}
- (DSDownMenu *)downMenu
{
    if (_downMenu == nil) {
        
        DSMenuItem *item = [DSMenuItem itemWithImage:[UIImage imageNamed:@"puff"] title:nil];
        DSMenuItem *item1 = [DSMenuItem itemWithImage:[UIImage imageNamed:@"puff"] title:nil];
        DSMenuItem *item2 = [DSMenuItem itemWithImage:[UIImage imageNamed:@"puff"] title:nil];
        DSMenuItem *item3 = [DSMenuItem itemWithImage:[UIImage imageNamed:@"puff"] title:nil];
        DSMenuItem *item4 = [DSMenuItem itemWithImage:[UIImage imageNamed:@"puff"] title:nil];
        DSMenuItem *item5 = [DSMenuItem itemWithImage:[UIImage imageNamed:@"puff"] title:nil];
        
        NSArray *items = @[item,item1,item2,item3,item4,item5];
        
        // 弹出黑色菜单
        _downMenu = [DSDownMenu showInView:self.view items:items oriY:0];
        
    }
    return _downMenu;
}
- (void)click{
    if (_isPopMenu == NO) {
        
        [self downMenu];
        
    }else{
        // 隐藏菜单
        [self.downMenu hide];
        
    }
    
    _isPopMenu = !_isPopMenu;
}


- (void)add{
    /**往数组里面增加 cell, 只需要操作*/
    DSRHome *home =[[DSRHome alloc] init];
    home.content =[NSString stringWithFormat:@"07:%02d分起床😄😄😄😄",arc4random_uniform(50)];
    NSInteger a = arc4random_uniform(12);
    
    home.day = a;
    [self.deals insertObject:home atIndex:0];
    //刷新
    //    [self.tableView reloadData];
    //    NSLog(@"1323");
    [self.tableView insertRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:0 inSection:0]] withRowAnimation:UITableViewRowAnimationLeft];
}
/**添加滑动删除功能*/
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    [self.deals removeObjectAtIndex:indexPath.row];
    [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.deals.count;
    //    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //    static NSString *ID =@"cell";
    //    CCTableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:ID];
    DSRHome *deal =self.deals[indexPath.row];
    DSRTableViewCell *cell =[DSRTableViewCell cell];
    _dsrCell =cell;
    cell.home =deal;
    return cell;
}


#pragma mark - Table view data source

@end
