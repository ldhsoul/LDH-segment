//
//  DHTabBarController.m
//  SegmentAndPage
//
//  Created by fubang on 2017/8/22.
//  Copyright © 2017年 fubang. All rights reserved.
//

#import "DHTabBarController.h"
#import "DHHomeViewController.h"
#import "DHPublicCommon.h"

@interface DHTabBarController ()

@end

@implementation DHTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initlizeTabItem];
}
-(void)initlizeTabItem{
    self.tabBar.tintColor = RGBCOLOR(136, 136, 136, 1);
    NSMutableDictionary *selectTextAttrs = [NSMutableDictionary dictionary];
    selectTextAttrs[NSForegroundColorAttributeName] = RGBCOLOR(3, 181, 152, 1);
}
-(UIImage*)imageOriginal:(NSString*)name {
    UIImage *image = [[UIImage imageNamed:name] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    return image;
}

@end
