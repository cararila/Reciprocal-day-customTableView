//
//  DSRAddEventTableViewCell.m
//  倒数日
//
//  Created by 马婷婷 on 15/8/13.
//  Copyright © 2015年 Cara. All rights reserved.
//

#import "DSRAddEventTableViewCell.h"
@interface DSRAddEventTableViewCell()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLable;

@property (weak, nonatomic) IBOutlet UILabel *dataLable;
@property (weak, nonatomic) IBOutlet UIView *bottomView;

@end
@implementation DSRAddEventTableViewCell
+ (instancetype)firstROwCell{
    return [[[NSBundle mainBundle] loadNibNamed:@"DSRAddEventTableViewCell" owner:nil options:nil] lastObject];
}
- (void)awakeFromNib {
    // Initialization code
    UIDatePicker *picker =[[UIDatePicker alloc ]init];
    picker.frame =self.bottomView.bounds;
    picker.locale =[NSLocale localeWithLocaleIdentifier:@"zh"];
    
    picker.datePickerMode =UIDatePickerModeDate;
    
    [picker addTarget:self action:@selector(choiceDate:) forControlEvents:UIControlEventValueChanged];

    [self.bottomView addSubview:picker];
}


/**当 picker 滚动的时候调用的方法*/
- (void)choiceDate:(UIDatePicker *)picker{
    /**日期转字符串*/
    NSDateFormatter *Fat =[[NSDateFormatter alloc] init];
    Fat.dateFormat =@"yyyy-MM-dd";
    NSString *dataStr =[Fat stringFromDate:picker.date];
    self.dataLable.text =dataStr;
}


@end
