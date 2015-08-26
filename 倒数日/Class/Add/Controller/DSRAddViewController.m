//
//  DSRAddViewController.m
//  倒数日
//
//  Created by 马婷婷 on 15/8/13.
//  Copyright © 2015年 Cara. All rights reserved.
//

#import "DSRAddViewController.h"
#import "DSRAddHeaderTableViewCell.h"
#import "DSRAddEventTableViewCell.h"
@interface DSRAddViewController ()<UITableViewDataSource,UITableViewDelegate,UIPickerViewDataSource,UIPickerViewDelegate>
// 记录当前tableView的所有数组
@property (nonatomic,strong) NSArray *iconArray;
@property (nonatomic,strong) NSArray *titleArray;

/** <#zhushi#>*/
@property (nonatomic,weak) UITableViewCell *addCell;
/** <#zhushi#>*/
@property (nonatomic,strong) UIDatePicker *picker;
/** <#zhushi#>*/
@property (nonatomic,strong) UIView *headView;




@end

@implementation DSRAddViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.tableView.contentInset = UIEdgeInsetsMake(64, 0, 0, 0);
//    self.tableView.sectionFooterHeight = 28;
//    self.tableView.sectionHeaderHeight = 28;
    self.tableView.delegate =self;
    self.tableView.dataSource =self;
    self.tableView.rowHeight =70;
    [self setupNav];
    [self setupTitle];
    [self setupCell];
    
}
- (void)setupCell{
    self.iconArray = @[@"ico_calendar",@"ico_sort",@"ico_repeat",@"ico_top",@"ico_clock",@"ico_remart"];
    
    self.titleArray = @[@"日期",@"分类",@"重复",@"置顶",@"提醒",@"备注"];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.titleArray.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
//    if (indexPath.row ==0) {
//        DSRAddEventTableViewCell *first =[DSRAddEventTableViewCell firstROwCell];
//        
//        return first;
//    }
        UITableViewCell *cell = [[UITableViewCell alloc] init];
        
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
        cell.textLabel.text = self.titleArray[indexPath.row];
        
        cell.imageView.image = [UIImage imageNamed:self.iconArray[indexPath.row]];
        cell.textLabel.font =[UIFont systemFontOfSize:20];
//
//        
        return cell;
    }
- (void)setupTitle{
    NSArray *s =@[@"添加事件"];
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
    /**左侧 barbuttonitem*/
    self.navigationItem.leftBarButtonItem =[UIBarButtonItem itemWithImage:@"btn_back_nor" selImage: @"btn_back_sel" target:self action:@selector(back)];
    /**右侧 barbuttonitem*/
     self.navigationItem.rightBarButtonItem =[UIBarButtonItem itemWithImage:@"btn_right_nor" selImage: @"btn_right_nor" target:self action:@selector(add)];
   
   }
- (void)back{
    //返回上个界面
    [self.navigationController popToViewController:[self.navigationController.childViewControllers firstObject] animated:YES];
}
- (void)add{
    
}




- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        
        DSRAddHeaderTableViewCell *cell = [[[NSBundle mainBundle] loadNibNamed:@"DSRAddHeaderTableViewCell" owner:nil options:nil] lastObject];
        UIView *backView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, cell.height + 10)];
        [backView addSubview:cell];
        cell.y = (backView.height - cell.height) * 0.5;
        backView.backgroundColor = [UIColor clearColor];
        _headView =backView;
        return backView;
        
    }
    return nil;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        
        return 120;
    }
    return 0;
}



/**点击cell的时候*/
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row ==0) {
        UIDatePicker *picker =[[UIDatePicker alloc ]init];
        picker.locale =[NSLocale localeWithLocaleIdentifier:@"zh"];

        picker.datePickerMode =UIDatePickerModeDate;

        [picker addTarget:self action:@selector(choiceDate:) forControlEvents:UIControlEventValueChanged];
        picker.frame =CGRectMake(0, 0, 300, 100);
    }

}

/**/
/**当 picker 滚动的时候调用的方法*/
- (void)choiceDate:(UIDatePicker *)picker{
    //    NSLog(@"哈哈123");
    /**日期转字符串*/
    NSDateFormatter *Fat =[[NSDateFormatter alloc] init];
    Fat.dateFormat =@"yyyy-MM-dd";
    NSString *dataStr =[Fat stringFromDate:picker.date];
//    self.addCell.contentView =dataStr;
//        _picker =picker;
}



@end
