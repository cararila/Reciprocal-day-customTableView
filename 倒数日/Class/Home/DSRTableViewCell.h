//
//  DSRTableViewCell.h
//  倒数日
//
//  Created by 马婷婷 on 15/8/13.
//  Copyright © 2015年 Cara. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DSRHome;
@interface DSRTableViewCell : UITableViewCell
/** 数据模型*/
@property (nonatomic,strong)  DSRHome *home;

+ (instancetype)cell;

@end
