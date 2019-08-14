//
//  DHPublicCommon.h
//  SegmentAndPage
//
//  Created by fubang on 2018/4/16.
//  Copyright © 2018年 fubang. All rights reserved.
//

#import <UIKit/UIKit.h>

#define NTalkSiteid @"kf_9734"
#define NTalkSDKKey @"33539C20-43E1-4019-B1D8-0B320DF47558"
#define NTalkSettingid @"kf_9734_1424934040980"
#define SCREENBOUNDS   [UIScreen mainScreen].bounds
#define SCREENWIDTH  [UIScreen mainScreen].bounds.size.width
#define SCREENHEIGHT [UIScreen mainScreen].bounds.size.height
/** 设备是否为iPhone 4/4S 分辨率320x480，像素640x960，@2x */
#define iPhone4s ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO)

/** 设备是否为iPhone 5C/5/5S 分辨率320x568，像素640x1136，@2x */
#define iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)

#define HexColor(hexValue) [bkCommon hexColor:hexValue]

//颜色值转换
#define RGBCOLOR(R,G,B,A) [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:A]

@interface DHPublicCommon : NSObject
+ (UIColor*) hexColor:(NSInteger)hexValue;
@end
