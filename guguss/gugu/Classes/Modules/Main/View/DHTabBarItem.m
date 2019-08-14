//
//  DHTabBarItem.m
//  SegmentAndPage
//
//  Created by fubang on 2018/4/16.
//  Copyright © 2018年 fubang. All rights reserved.
//

#import "DHTabBarItem.h"
#define RGBCOLOR(R,G,B,A) [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:A]
@implementation DHTabBarItem
-(void)awakeFromNib{
    [super awakeFromNib];
    NSMutableDictionary *selectTextAttrs = [NSMutableDictionary dictionary];
    selectTextAttrs[NSForegroundColorAttributeName] = RGBCOLOR(253, 91, 54, 1);
    [self setTitleTextAttributes:selectTextAttrs forState:UIControlStateSelected];
    
}
-(UIImage*)imageOriginal:(NSString*)name {
    UIImage *image = [[UIImage imageNamed:name] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    return image;
}
@end
