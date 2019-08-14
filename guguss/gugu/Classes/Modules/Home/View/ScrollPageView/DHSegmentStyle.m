//
//  DHSegmentStyle.m
//  gugu
//
//  Created by fubang on 2018/7/10.
//  Copyright © 2018年 ldh. All rights reserved.
//

#import "DHSegmentStyle.h"
#import "DHCommon.h"

@implementation DHSegmentStyle
- (instancetype)init {
    if(self = [super init]) {
        _showCover = NO;
        _showLine = YES;
        _scaleTitle = NO;
        _scrollTitle = YES;
        _segmentViewBounces = YES;
        _contentViewBounces = YES;
        _gradualChangeTitleColor = NO;
        _showExtraButton = NO;
        _scrollContentView = YES;
        _adjustCoverOrLineWidth = NO;
        _showImage = NO;
        _autoAdjustTitlesWidth = NO;
        _animatedContentViewWhenTitleClicked = YES;
        _extraBtnBackgroundImageName = nil;
        _scrollLineHeight = 2.0;
        _scrollLineColor = RGB(3, 181, 152);
        _coverBackgroundColor = [UIColor lightGrayColor];
        _coverCornerRadius = 12.0;
        _coverHeight = 28.0;
        _titleMargin = 15.0;
        _titleFont = [UIFont systemFontOfSize:14.0];
        _titleBigScale = 1.3;
        _normalTitleColor = RGB(3, 181, 152);
        _selectedTitleColor = RGB(136, 136, 136);
        _segmentHeight = 44.0;
    }
    return self;
}


- (void)setSegmentViewComponent:(SegmentViewComponent)segmentViewComponent {
    
    if (segmentViewComponent & SegmentViewComponentShowCover) {
        _showCover = YES;
    }
    else if (segmentViewComponent & SegmentViewComponentShowLine) {
        _showLine = YES;
    }
    else if (segmentViewComponent & SegmentViewComponentShowImage) {
        _showImage = YES;
    }
    else if (segmentViewComponent & SegmentViewComponentShowExtraButton) {
        _showExtraButton = YES;
    }
    else if (segmentViewComponent & SegmentViewComponentScaleTitle) {
        _scaleTitle = YES;
    }
    else if (segmentViewComponent & SegmentViewComponentScrollTitle) {
        _scrollTitle = YES;
    }
    else if (segmentViewComponent & SegmentViewComponentBounces) {
        _segmentViewBounces = YES;
    }
    else if (segmentViewComponent & SegmentViewComponentGraduallyChangeTitleColor) {
        _gradualChangeTitleColor = YES;
    }
    else if (segmentViewComponent & SegmentViewComponentAdjustCoverOrLineWidth) {
        _adjustCoverOrLineWidth = YES;
    }
    else  {
        _autoAdjustTitlesWidth = YES;
    }
    
}
@end
