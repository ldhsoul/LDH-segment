//
//  DHUserInfoITTACell.m
//  MY
//
//  Created by fubang on 2017/7/19.
//  Copyright © 2017年 fubang. All rights reserved.
//

#import "DHUserInfoITTACell.h"
#import "DHModel.h"
#import "Common.h"

@interface DHUserInfoITTACell ()

@property (nonatomic,strong)UIImageView *headImgV;
@property (nonatomic,strong)UILabel *headTitleLab;
@property (nonatomic,strong)UILabel *subTitleLab;
@property (nonatomic,strong)UIImageView *arrowImgV;
@property (nonatomic,strong)UIView *bottomLineView;
@property (nonatomic,strong)UIImageView *newsImgV;

@end

@implementation DHUserInfoITTACell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle: style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        [self setContentViews];
    }
    return self;

}
-(void)setContentViews
{
    _headImgV = [[UIImageView alloc] initWithFrame:CGRectZero];
    [self.contentView addSubview:_headImgV];
    
    _headTitleLab =[[UILabel alloc]initWithFrame:CGRectZero];
    _headTitleLab.font = [UIFont systemFontOfSize:15];
    _headTitleLab.textColor = HexColor(0x444444);
    [self.contentView addSubview:_headTitleLab];
    
    _subTitleLab = [[UILabel alloc]initWithFrame:CGRectZero];
    _subTitleLab.font = [UIFont systemFontOfSize:14];
    _subTitleLab.textAlignment = NSTextAlignmentRight;
    _subTitleLab.textColor = HexColor(0x888888);
    [self.contentView addSubview:_subTitleLab];
    
    _arrowImgV = [[UIImageView alloc]initWithFrame:CGRectZero];
    _arrowImgV.image = [UIImage imageNamed:@"BK_My_LeftArrow"];
    _arrowImgV.contentMode = UIViewContentModeScaleAspectFit;
    [self.contentView addSubview:_arrowImgV];
    
    _bottomLineView = [[UIView alloc]init];
    _bottomLineView.backgroundColor = HexColor(0xDADADA);
    [self addSubview:_bottomLineView];
    
    _newsImgV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"BK_My_New_icon"]];
    _newsImgV.contentMode = UIViewContentModeScaleAspectFit;
    [self.contentView addSubview:_newsImgV];
    
    [self layoutViews];

}
-(void)layoutViews
{
    CGFloat diatance = ApplicationBackGauge;
    [_headImgV mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.mas_equalTo(self.mas_centerY).offset(0);
        make.left.mas_equalTo(self.mas_left).offset(diatance);
        make.size.mas_equalTo(CGSizeMake(20, 20));
        
    }];
    
    [_headTitleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.mas_equalTo(self.mas_centerY).offset(0);
        make.left.mas_equalTo(_headImgV.mas_right).offset(11);
        make.height.mas_equalTo(@(20));
    }];
    
    [_newsImgV mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_headTitleLab.mas_right).offset(2);
        make.top.mas_equalTo(_headImgV.mas_top).offset(1);
        make.size.mas_equalTo(CGSizeMake(24, 10));
    }];
    
    [_subTitleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.mas_equalTo(self.mas_centerY).offset(0);
        make.right.mas_equalTo(_arrowImgV.mas_left).offset(-2);
        make.height.mas_equalTo(@(20));
    }];
    
    
    [_arrowImgV mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.mas_equalTo(self.mas_centerY).offset(0);
        make.right.mas_equalTo(self.mas_right).offset(-ApplicationBackGauge+2);
        make.size.mas_equalTo(CGSizeMake(15,15));
    }];
    
    [_bottomLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.height.mas_equalTo(@(0.5));
        make.left.mas_equalTo(self.mas_left).offset(diatance);
        make.right.mas_equalTo(self.mas_right).offset(0);
        make.bottom.mas_equalTo(self.mas_bottom).offset(0);
    }];

}

-(void)fillData:(id)data
{
     DHModel *cellModel = data;
    _headImgV.image = [UIImage imageNamed:cellModel.image];
    _headTitleLab.text = cellModel.title;
    _subTitleLab.text = cellModel.subTitle;
    _newsImgV.hidden = cellModel.isNewsImgV;
    _bottomLineView.hidden = !cellModel.isShowBottomLine;
    
    
    
}
@end
