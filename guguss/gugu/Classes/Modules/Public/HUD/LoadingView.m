//
//  LoadingView.m
//  MY
//
//  Created by fubang on 2017/7/20.
//  Copyright © 2017年 fubang. All rights reserved.
//

#import "LoadingView.h"

NSString *const BKLoadingShoppingCart = @"BKLoadingShoppingCart";
NSString *const BKLoading = @"BKLoading";

@implementation LoadingView
{
    UIImageView *_gif;

}


+ (void)loadingInView:(UIView *)view
{
    
    NSString *bundlePath = [[NSBundle mainBundle] pathForResource:BKLoading ofType:@"bundle"];
    NSBundle *bundle = [NSBundle bundleWithPath:bundlePath];
    
    NSMutableArray *images = [NSMutableArray array];
    
    for (int i = 0; i <= 24; i++) {
        NSString *imagePath = [bundle pathForResource:[NSString stringWithFormat:@"%@_%d@2x",BKLoading, i] ofType:@"png"];
        UIImage *image = [UIImage imageWithContentsOfFile:imagePath];
        [images addObject:image];
    }
    
    [[LoadingView sharedView] loading:view andImages:images];
    

}
+ (void)loadingShoppingCartInView:(UIView *)view
{
    NSString *bundlePath = [[NSBundle mainBundle] pathForResource:BKLoadingShoppingCart ofType:@"bundle"];
    NSBundle *bundle = [NSBundle bundleWithPath:bundlePath];
    
    NSMutableArray *images = [NSMutableArray array];
    
    for (int i = 0; i <= 15; i++) {
        NSString *imagePath = [bundle pathForResource:[NSString stringWithFormat:@"%@_%d@2x",BKLoadingShoppingCart, i] ofType:@"png"];
        UIImage *image = [UIImage imageWithContentsOfFile:imagePath];
        [images addObject:image];
    }
    
    [[LoadingView sharedView] loading:view andImages:images];
    
}

- (void)loading:(UIView *)view andImages:(NSArray <UIImage *> *)images
{
    self.frame = view.bounds;
    [view addSubview:self];
    
    CGFloat animationDuration = images.count / 15.0;
    
    _gif.animationImages = images;
    _gif.animationDuration = animationDuration;
    _gif.animationRepeatCount = 0;
    [_gif startAnimating];
}

+(instancetype)sharedView
{
    static LoadingView *loading;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        loading = [[LoadingView alloc] initPrivate];
    });
    return loading;

}
-(instancetype)initPrivate
{
    self = [super init];
    if (self) {
        [self initialize];
    }
    
    return self;
}

- (void)initialize
{
    self.backgroundColor = [UIColor whiteColor];
    
    _gif = [[UIImageView alloc] init];
    _gif.contentMode = UIViewContentModeScaleAspectFit;
    
    [self makeConstraints];
}
- (void)makeConstraints
{
    _gif.translatesAutoresizingMaskIntoConstraints = NO;
    NSLayoutConstraint *centerXConstraint = [NSLayoutConstraint constraintWithItem:_gif attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0];
    NSLayoutConstraint *centerYConstraint = [NSLayoutConstraint constraintWithItem:_gif attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:-32];
    NSLayoutConstraint *widthConstraint = [NSLayoutConstraint constraintWithItem:_gif attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeWidth multiplier:0 constant:35];
    
    [self addConstraints:@[centerXConstraint, centerYConstraint,widthConstraint]];
    
    [self addSubview:_gif];
}
+ (void)dismiss
{
    [[LoadingView sharedView] dismiss];
}
- (void)dismiss
{
    [_gif stopAnimating];
    _gif.animationImages = nil;
    [self removeFromSuperview];
}

@end
