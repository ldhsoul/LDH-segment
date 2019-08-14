//
//  UIViewController+DHScrollPageController.h
//  SegmentAndPage
//
//  Created by fubang on 2017/11/9.
//  Copyright © 2017年 fubang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (DHScrollPageController)

/**
 *  所有子控制的父控制器, 方便在每个子控制页面直接获取到父控制器进行其他操作
 */
@property (nonatomic, weak, readonly) UIViewController *dh_scrollViewController;
@property (nonatomic, assign) NSInteger dh_currentIndex;


@end
