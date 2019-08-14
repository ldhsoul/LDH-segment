//
//  DHSectionModel.h
//  MY
//
//  Created by fubang on 2017/7/19.
//  Copyright © 2017年 fubang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DHModel.h"

@interface DHSectionModel : NSObject

@property(nonatomic,strong) NSArray <DHModel *> *cell;
@property(nonatomic,strong) NSString *title;
@property(nonatomic,assign) CGFloat headerhHeight;
@property(nonatomic,assign) CGFloat footerHeight;

+(instancetype)sectionModelWithTitle:(NSString *)title andCell:(NSArray<DHModel *> *)cell;

@end
