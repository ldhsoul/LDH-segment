//
//  DHPublicCommon.m
//  SegmentAndPage
//
//  Created by fubang on 2018/4/16.
//  Copyright © 2018年 fubang. All rights reserved.
//

#import "DHPublicCommon.h"

@implementation DHPublicCommon
+ (UIColor*) hexColor:(NSInteger)hexValue {
    
    CGFloat red = (CGFloat)((hexValue & 0xFF0000) >> 16) / 255.0;
    CGFloat green = (CGFloat)((hexValue & 0xFF00) >> 8) /255.0;
    CGFloat blue = (CGFloat)(hexValue & 0xFF) / 255.0;
    UIColor *color = [UIColor colorWithRed:red green:green blue:blue alpha:1];
    return color;
}
@end
