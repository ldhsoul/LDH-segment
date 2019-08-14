//
//  UIViewController+DHScrollPageController.m
//  SegmentAndPage
//
//  Created by fubang on 2017/11/9.
//  Copyright © 2017年 fubang. All rights reserved.
//

#import "UIViewController+DHScrollPageController.h"
#import <objc/runtime.h>
#import "DHScrollPageDelegate.h"
char DHIndexKey;

@implementation UIViewController (DHScrollPageController)

-(UIViewController *)dh_scrollViewController
{
    UIViewController *controller = self;
    while (controller) {
        if ([controller conformsToProtocol:@protocol(DHScrollPageDelegate)]) {
            break;
        }
        controller = controller.parentViewController;
    }
    return controller;
    
}

-(void)setDh_currentIndex:(NSInteger)dh_currentIndex
{
    objc_setAssociatedObject(self, &DHIndexKey, [NSNumber numberWithInteger:dh_currentIndex], OBJC_ASSOCIATION_ASSIGN);
    
}

-(NSInteger)dh_currentIndex
{
    return [objc_getAssociatedObject(self, &DHIndexKey) integerValue];
    
}

@end
