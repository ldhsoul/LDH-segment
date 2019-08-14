//
//  DHModel.h
//  MY
//
//  Created by fubang on 2017/7/19.
//  Copyright © 2017年 fubang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DHModel : NSObject

@property(nonatomic,retain) NSString *title;
@property(nonatomic,retain) NSString *subTitle;
@property(nonatomic,retain) NSString *image;
@property(nonatomic,assign) BOOL isNewsImgV;
@property(nonatomic,retain) NSString *selectorString;
@property(nonatomic,assign) BOOL isShowBottomLine;
@property(nonatomic,assign) BOOL isArrow;
@property(nonatomic,assign) UITableViewCellAccessoryType accessoryType;
@property(nonatomic,assign) UITableViewCellStyle style;
@property(nonatomic,assign) UITableViewCellSelectionStyle selectionStyle;

@property(nonatomic,strong) NSString *className;
@property(nonatomic,strong) NSString *reuseIdentifier;
@property(nonatomic,assign) CGFloat height;

@property(nonatomic,weak) id delegate;
@property(nonatomic,strong) id userInfo;

@property(nonatomic,assign) CGSize size;


+(instancetype)cellModelWithTitle:(NSString*)title sel:(NSString*)selectorString;
+(instancetype)cellModelWithTitle:(NSString*)title subTitle:(NSString*)subTitle image:(NSString*)image sel:(NSString*)selectorString;


@end
