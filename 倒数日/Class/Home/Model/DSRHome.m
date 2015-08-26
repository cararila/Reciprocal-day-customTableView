//
//  DSRHome.m
//  倒数日
//
//  Created by 马婷婷 on 15/8/13.
//  Copyright © 2015年 Cara. All rights reserved.
//

#import "DSRHome.h"

@implementation DSRHome
+ (instancetype)homeWithDict:(NSDictionary *)dict{
    DSRHome *home =[[DSRHome alloc] init];
    
    [home setValuesForKeysWithDictionary:dict];
    
    return home;
}
@end
