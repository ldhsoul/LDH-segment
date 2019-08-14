//
//  LoadingView.h
//  MY
//
//  Created by fubang on 2017/7/20.
//  Copyright © 2017年 fubang. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface LoadingView : UIView

- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)new NS_UNAVAILABLE;

+ (void)loadingInView:(UIView *)view;
+ (void)loadingShoppingCartInView:(UIView *)view;
+ (void)dismiss;
@end
