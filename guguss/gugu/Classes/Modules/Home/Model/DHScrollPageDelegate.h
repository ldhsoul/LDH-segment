//
//  DHScrollPageDelegate.h
//  SegmentAndPage
//
//  Created by fubang on 2017/8/22.
//  Copyright © 2017年 fubang. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DHTitleView;

@protocol DHScrollPageViewChildVcDelegate <NSObject>

@optional
- (void)dh_viewWillAppearForIndex:(NSInteger)index;
- (void)dh_viewDidAppearForIndex:(NSInteger)index;
- (void)dh_viewWillDisappearForIndex:(NSInteger)index;
- (void)dh_viewDidDisappearForIndex:(NSInteger)index;
- (void)dh_viewDidLoadForIndex:(NSInteger)index;

@end

@protocol DHScrollPageDelegate <NSObject>

-(NSInteger)numberOfViewController;

-(UIViewController<DHScrollPageViewChildVcDelegate> *)childViewController:(UIViewController<DHScrollPageViewChildVcDelegate> *)reuseViewController forIndex:(NSIndexPath *)indexPath;

@optional

//- (BOOL)scrollPageController:(UIViewController *)scrollPageController contentScrollView:(DHCollectionView *)scrollView shouldBeginPanGesture:(UIPanGestureRecognizer *)panGesture;

- (void)setUpTitleView:(DHTitleView *)titleView forIndex:(NSInteger)index;

/**
 *  页面将要出现
 *
 */
- (void)scrollPageController:(UIViewController *)scrollPageController childViewControllWillAppear:(UIViewController *)childViewController forIndex:(NSInteger)index;
/**
 *  页面已经出现
 *
 
 */
- (void)scrollPageController:(UIViewController *)scrollPageController childViewControllDidAppear:(UIViewController *)childViewController forIndex:(NSInteger)index;

- (void)scrollPageController:(UIViewController *)scrollPageController childViewControllWillDisappear:(UIViewController *)childViewController forIndex:(NSInteger)index;
- (void)scrollPageController:(UIViewController *)scrollPageController childViewControllDidDisappear:(UIViewController *)childViewController forIndex:(NSInteger)index;
/**
 *  页面添加到父视图时，在父视图中显示的位置
 *  @param  containerView   childController 的 self.view 父视图
 *  @return 返回最终显示的位置
 */
- (CGRect)frameOfChildControllerForContainer:(UIView *)containerView;

//segmentDelegate
-(void)adjustUIWithProgress:(CGFloat)progress oldIndex:(NSInteger)oldIndex currentIndex:(NSInteger)currentIndex;

- (void)adjustTitleOffSetToCurrentIndex:(NSInteger)currentIndex;

@end


