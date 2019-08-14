//
//  Common.h
//  MY
//
//  Created by fubang on 2017/7/19.
//  Copyright © 2017年 fubang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Masonry.h>
#define HexColor(hexValue) [Common hexColor:hexValue]
#define ApplicationBackGauge 12 //到手机屏幕边缘的间距
#define randomColor random(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))
#define RGBACOLOR(r,g,b,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]
#define RGB(__r, __g, __b)  [UIColor colorWithRed:(1.0*(__r)/255)\
green:(1.0*(__g)/255)\
blue:(1.0*(__b)/255)\
alpha:1.0]
#define RANDOMCOLOR [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1.0]

#define DHALL 9
@interface Common : NSObject

+ (UIColor*) hexColor:(NSInteger)hexValue;
+(UIFont*)systemFontOfSize:(CGFloat)size;
@end
