//
//  DSRTableViewCell.m
//  倒数日
//
//  Created by 马婷婷 on 15/8/13.
//  Copyright © 2015年 Cara. All rights reserved.
//

#import "DSRTableViewCell.h"
#import "DSRHome.h"
@interface DSRTableViewCell()
@property (weak, nonatomic) IBOutlet UILabel *contentLable;
@property (weak, nonatomic) IBOutlet UILabel *dayLable;


@end
@implementation DSRTableViewCell
+ (instancetype)cell{
    return [[[NSBundle mainBundle] loadNibNamed:@"DSRTableViewCell" owner:nil options:nil] lastObject];
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)setHome:(DSRHome *)home{
    _home =home;
    self.contentLable.text =home.content;
    self.dayLable.text =[NSString stringWithFormat:@"%lu",home.day] ;
}
@end
