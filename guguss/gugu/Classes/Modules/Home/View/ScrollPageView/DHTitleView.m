//
//  DHTitleView.m
//  gugu
//
//  Created by fubang on 2018/7/10.
//  Copyright © 2018年 ldh. All rights reserved.
//

#import "DHTitleView.h"
#import "UIImageView+HighlightedWebCache.h"
#import "DHCommon.h"
#import "CacheImage.h"
#import "UIView+DHFrame.h"

@interface DHTitleView() {
    CGSize _titleSize;
    CGFloat _imageHeight;
    CGFloat _imageWidth;
    BOOL _isShowImage;
}
@property (strong, nonatomic) UIImageView *imageView;
@property (strong, nonatomic) UILabel *label;
@property (strong, nonatomic) UIView *contentView;

/** 后续添加 */
// TODO: - 添加badge
@property (nonatomic) UIView *badgeView;

@end

@implementation DHTitleView

- (instancetype)init {
    self = [self initWithFrame:CGRectZero];
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.currentTransformSx = 1.0;
        self.userInteractionEnabled = YES;
        self.backgroundColor = [UIColor clearColor];
        _isShowImage = NO;
        
        [self addSubview:self.label];
        
    }
    
    return self;
}

- (void)setCurrentTransformSx:(CGFloat)currentTransformSx {
    _currentTransformSx = currentTransformSx;
    self.transform = CGAffineTransformMakeScale(currentTransformSx, currentTransformSx);
}


- (void)layoutSubviews {
    [super layoutSubviews];
    
    if (!_isShowImage) {
        self.label.frame = self.bounds;
    }
    
}

- (void)adjustSubviewFrame {
    _isShowImage = YES;
    
    CGRect contentViewFrame = self.bounds;
    contentViewFrame.size.width = [self titleViewWidth];
    contentViewFrame.origin.x = (self.frame.size.width - contentViewFrame.size.width)/2;
    contentViewFrame.origin.y = 38;
    self.contentView.frame = contentViewFrame;
    self.label.frame = self.contentView.bounds;
    
    
    [self addSubview:self.contentView];
    [self.label removeFromSuperview];
    [self.contentView addSubview:self.label];
    [self.contentView addSubview:self.imageView];
    
    switch (self.imagePosition) {
        case TitleImagePositionTop: {
            CGRect contentViewFrame = self.contentView.frame;
            contentViewFrame.size.height = self.bounds.size.height;
            contentViewFrame.origin.y = (self.frame.size.height - contentViewFrame.size.height)*0.5;
            self.contentView.frame = contentViewFrame;
            self.imageView.frame = CGRectMake(0, 9, 25, 25);
            self.label.frame = CGRectMake(0, 40, self.contentView.width, 15);
            CGPoint center = self.imageView.center;
            center.x = self.label.center.x;
            self.imageView.center = center;
            break;
        }
        case TitleImagePositionLeft: {
            
            CGRect labelFrame = self.label.frame;
            labelFrame.origin.x = _imageWidth;
            labelFrame.size.width = self.contentView.frame.size.width - _imageWidth;
            self.label.frame = labelFrame;
            
            CGRect imageFrame = CGRectZero;
            imageFrame.size.height = _imageHeight;
            imageFrame.size.width = _imageWidth;
            imageFrame.origin.y = (self.contentView.frame.size.height - imageFrame.size.height)/2;
            self.imageView.frame = imageFrame;
            
            break;
        }
        case TitleImagePositionRight: {
            CGRect labelFrame = self.label.frame;
            labelFrame.size.width = self.contentView.frame.size.width - _imageWidth;
            self.label.frame = labelFrame;
            
            CGRect imageFrame = CGRectZero;
            imageFrame.origin.x = CGRectGetMaxX(self.label.frame);
            imageFrame.size.height = _imageHeight;
            imageFrame.size.width = _imageWidth;
            imageFrame.origin.y = (self.contentView.frame.size.height - imageFrame.size.height)/2;
            self.imageView.frame = imageFrame;
            break;
        }
        case TitleImagePositionCenter:
            
            self.imageView.frame = self.contentView.bounds;
            [self.label removeFromSuperview];
            break;
        default:
            break;
    }
    
}



- (CGFloat)titleViewWidth {
    CGFloat width = 0.0f;
    switch (self.imagePosition) {
        case TitleImagePositionLeft:
            width = _imageWidth + _titleSize.width;
            break;
        case TitleImagePositionRight:
            width = _imageWidth + _titleSize.width;
            break;
        case TitleImagePositionCenter:
            width = _imageWidth;
            break;
        default:
            width = _titleSize.width;
            break;
    }
    
    return width;
}


- (void)setNormalImage:(NSString *)normalImage {
    _normalImage = normalImage;
    _imageHeight = self.frame.size.height/2;
    //     [self.imageView load:normalImage];
    __weak typeof(self.imageView) weakImageView = self.imageView;
    [CacheImage downloadImageWithURLString:normalImage progress:nil completed:^(UIImage *image, NSError *error, NSURL *imageURL) {
        if(!image) {
            weakImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",_text]];
            return;
        }
        weakImageView.image = image;
        
    }];
}

- (void)setSelectedImage:(NSString *)selectedImage {
    _selectedImage = selectedImage;
    __weak typeof(self.imageView) weakImageView = self.imageView;
    [CacheImage downloadImageWithURLString:selectedImage progress:nil completed:^(UIImage *image, NSError *error, NSURL *imageURL) {
        if(!image) {
            weakImageView.highlightedImage = [UIImage imageNamed:[NSString stringWithFormat:@"%@点",_text]];
            return;
        }
        weakImageView.highlightedImage = image;
        if(self.selected) {
            weakImageView.highlighted = NO;
            weakImageView.highlighted = YES;
        }
    }];
    
}

- (void)setFont:(UIFont *)font {
    _font = font;
    self.label.font = font;
}

- (void)setText:(NSString *)text {
    _text = text;
    self.label.text = text;
    CGRect bounds = [text boundingRectWithSize:CGSizeMake(MAXFLOAT, 0.0) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: self.label.font} context:nil];
    _titleSize = bounds.size;
    
}

- (void)setTextColor:(UIColor *)textColor {
    _textColor = textColor;
    self.label.textColor = textColor;
    
}

- (void)setSelected:(BOOL)selected {
    _selected = selected;
    self.imageView.highlighted = selected;
}

- (UIImageView *)imageView {
    if (_imageView == nil) {
        _imageView = [[UIImageView alloc] init];
        _imageView.contentMode = UIViewContentModeScaleAspectFill;
    }
    return _imageView;
}

- (UILabel *)label {
    if (_label == nil) {
        _label = [[UILabel alloc] init];
        _label.textAlignment = NSTextAlignmentCenter;
    }
    return _label;
}

- (UIView *)contentView {
    if (!_contentView) {
        _contentView = [UIView new];
    }
    return _contentView;
}

@end
