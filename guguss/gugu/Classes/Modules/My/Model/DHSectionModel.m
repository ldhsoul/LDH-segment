//
//  DHSectionModel.m
//  MY
//
//  Created by fubang on 2017/7/19.
//  Copyright © 2017年 fubang. All rights reserved.
//

#import "DHSectionModel.h"

@implementation DHSectionModel


+(instancetype)sectionModelWithTitle:(NSString *)title andCell:(NSArray<DHModel *> *)cell
{
    DHSectionModel *sectionModel = [[DHSectionModel alloc] init];
    
    sectionModel.title = title;
    
    sectionModel.cell = cell;

    
    return sectionModel;
}
@end
