//
//  DHCycleScrollCollectionViewCell.m
//  SegmentAndPage
//
//  Created by fubang on 2017/11/15.
//  Copyright © 2017年 fubang. All rights reserved.
//

#import "DHCycleScrollCollectionViewCell.h"
#import "DHHomeCommon.h"
//#import <SDCycleScrollView.h>
@interface DHCycleScrollCollectionViewCell()

@property (nonatomic,strong)NSArray *imageArray;
//@property (nonatomic,strong)SDCycleScrollView *cycleScrollView;
@end


@implementation DHCycleScrollCollectionViewCell


-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self initialize];
    }
    return self;
}

-(NSArray *)imageArray
{
    
    if (!_imageArray) {
        
        _imageArray = [NSArray array];
        
      
    }
    return _imageArray;
}

-(void)initialize{
    
    self.backgroundColor = RANDOMCOLOR;
//    self.cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, CGRectGetWidth([UIScreen mainScreen].bounds), 160) delegate:self placeholderImage:[UIImage imageNamed:@"111"]];
//    self.cycleScrollView.currentPageDotColor = [UIColor redColor];
//    self.cycleScrollView.pageDotColor = [UIColor lightGrayColor];
//    self.cycleScrollView.titlesGroup = @[@"title_1",@"title_2",@"title_3"];
//    [self addSubview:self.cycleScrollView];
//}
//
//- (void)fillData:(id)data{
//
//    _imageArray = @[@"http://imgsrc.baidu.com/imgad/pic/item/f9dcd100baa1cd11c5f5440eb212c8fcc3ce2d58.jpg",
//                    @"http://imgsrc.baidu.com/imgad/pic/item/f9dcd100baa1cd11c5f5440eb212c8fcc3ce2d58.jpg",
//                    @"http://imgsrc.baidu.com/imgad/pic/item/f9dcd100baa1cd11c5f5440eb212c8fcc3ce2d58.jpg"];
//    self.cycleScrollView.imageURLStringsGroup = self.imageArray;
//
}

+(CGSize)calculateSize:(id)data
{
//    if(!data || ![data isKindOfClass:[NSArray class]]) {
//        return CGSizeMake(0, 0);
//    }
    
    return CGSizeMake(SCREENWIDTH, 145*SCREENWIDTH/375.0f);
    
}
@end
