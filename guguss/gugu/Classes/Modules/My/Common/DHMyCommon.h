//
//  DHMyCommon.h
//  MY
//
//  Created by fubang on 2017/7/19.
//  Copyright © 2017年 fubang. All rights reserved.
//

#import <Foundation/Foundation.h>

#define MyLocalizedString(key) [DHMyCommon localizedStringWithKey:key]



@interface DHMyCommon : NSObject

+(NSString*)localizedStringWithKey:(NSString*)key;

@end
