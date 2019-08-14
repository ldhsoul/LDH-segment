//
//  DHMyCommon.m
//  MY
//
//  Created by fubang on 2017/7/19.
//  Copyright © 2017年 fubang. All rights reserved.
//

#import "DHMyCommon.h"

NSString * const MyLocalizableTableName = @"MyLocalizable";

@implementation DHMyCommon


+(NSString*)localizedStringWithKey:(NSString*)key{
    return NSLocalizedStringFromTable(key, MyLocalizableTableName, nil);
}


@end
