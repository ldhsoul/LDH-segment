//
//  DHCollectionView.h
//  SegmentAndPage
//
//  Created by fubang on 2017/11/9.
//  Copyright © 2017年 fubang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DHScrollPageDelegate.h"

@interface DHCollectionView : UICollectionView

@property (weak,nonatomic)id<DHScrollPageDelegate> sdelegate;

/** 给外界可以设置ContentOffSet的方法 */
- (void)setContentOffSet:(CGPoint)offset animated:(BOOL)animated;
@end
