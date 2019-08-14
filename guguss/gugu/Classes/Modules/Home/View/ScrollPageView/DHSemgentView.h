//
//  DHSemgentView.h
//  SegmentAndPage
//
//  Created by fubang on 2017/11/9.
//  Copyright © 2017年 fubang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DHSegmentStyle.h"
#import "DHScrollPageDelegate.h"
@class DHSegmentStyle;
@class DHTitleView;

typedef void(^TitleBtnOnClickBlock)(DHTitleView *titleView, NSInteger index);
typedef void(^ExtraBtnOnClick)(UIButton *extraBtn);

@interface DHSemgentView : UIView

- (instancetype)initWithFrame:(CGRect )frame segmentStyle:(DHSegmentStyle *)segmentStyle delegate:(id<DHScrollPageDelegate>)delegate titles:(NSArray *)titles pictures:(NSArray *)pictures select_pictures:(NSArray *)select_pictures titleDidClick:(TitleBtnOnClickBlock)titleDidClick;

/** 切换下标的时候根据progress同步设置UI*/
- (void)adjustUIWithProgress:(CGFloat)progress oldIndex:(NSInteger)oldIndex currentIndex:(NSInteger)currentIndex;
/** 让选中的标题居中*/
- (void)adjustTitleOffSetToCurrentIndex:(NSInteger)currentIndex;
/** 设置选中的下标*/
- (void)setSelectedIndex:(NSInteger)index animated:(BOOL)animated;
/** 重新刷新标题的内容*/
- (void)reloadTitlesWithNewTitles:(NSArray *)titles;

@end
