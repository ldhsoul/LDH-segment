
//
//  DHModel.m
//  MY
//
//  Created by fubang on 2017/7/19.
//  Copyright © 2017年 fubang. All rights reserved.
//

#import "DHModel.h"

@implementation DHModel


+(instancetype)cellModelWithTitle:(NSString*)title sel:(NSString*)selectorString
{
    DHModel *cell = [[DHModel alloc] init];
    cell.title = title;
    cell.selectorString = selectorString;
    return cell;
}

+(instancetype)cellModelWithTitle:(NSString*)title subTitle:(NSString*)subTitle image:(NSString*)image sel:(NSString*)selectorString
{

    DHModel *cellModel = [[DHModel alloc] init];
    
    cellModel.title = title;
    cellModel.subTitle = subTitle;
    cellModel.image = image;
    cellModel.selectorString = selectorString;
    
    return cellModel;

}

@end
