//
//  Common.m
//  MY
//
//  Created by fubang on 2017/7/19.
//  Copyright © 2017年 fubang. All rights reserved.
//

#import "Common.h"

@implementation Common

+ (UIColor*) hexColor:(NSInteger)hexValue {
    
    CGFloat red = (CGFloat)((hexValue & 0xFF0000) >> 16) / 255.0;
    CGFloat green = (CGFloat)((hexValue & 0xFF00) >> 8) /255.0;
    CGFloat blue = (CGFloat)(hexValue & 0xFF) / 255.0;
    UIColor *color = [UIColor colorWithRed:red green:green blue:blue alpha:1];
    return color;
}
+(UIFont*)systemFontOfSize:(CGFloat)size {
    
    return [UIFont systemFontOfSize:size];
}
@end
