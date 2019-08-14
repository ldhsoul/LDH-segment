//
//  DHHome_SectionModel.h
//  SegmentAndPage
//
//  Created by fubang on 2017/11/15.
//  Copyright © 2017年 fubang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DHHome_CellModel.h"


@interface DHHome_SectionModel : NSObject

@property(nonatomic,strong) NSString *title;
@property(nonatomic,strong) NSArray<DHHome_CellModel*> *cells;

@property (nonatomic,assign)CGFloat headerhHeight;
@property (nonatomic,assign)CGFloat footerHeight;

+(DHHome_SectionModel*)sectionModelWithTitle:(NSString *)title cells:(NSArray<DHHome_CellModel*>*)items;


@end
