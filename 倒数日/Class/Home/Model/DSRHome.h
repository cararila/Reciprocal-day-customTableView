//
//  DSRHome.h
//  倒数日
//
//  Created by 马婷婷 on 15/8/13.
//  Copyright © 2015年 Cara. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DSRHome : NSObject
/** content*/
@property (nonatomic,strong) NSString *content;
/** time*/
@property (nonatomic,assign) NSInteger day;

+ (instancetype)homeWithDict:(NSDictionary *)dict;
@end
