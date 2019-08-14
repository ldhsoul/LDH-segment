//
//  DHHome_SectionModel.m
//  SegmentAndPage
//
//  Created by fubang on 2017/11/15.
//  Copyright © 2017年 fubang. All rights reserved.
//

#import "DHHome_SectionModel.h"


@implementation DHHome_SectionModel


+(DHHome_SectionModel*)sectionModelWithTitle:(NSString *)title cells:(NSArray<DHHome_CellModel*>*)items
{
    DHHome_SectionModel *section = [[DHHome_SectionModel alloc] init];
    section.title = title;
    section.cells = items;
    return section;

    
}
@end
