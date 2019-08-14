//
//  DHCommonCollectionViewCell.m
//  SegmentAndPage
//
//  Created by fubang on 2017/11/15.
//  Copyright © 2017年 fubang. All rights reserved.
//

#import "DHCommonCollectionViewCell.h"
#import "DHHomeCommon.h"
@implementation DHCommonCollectionViewCell

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self initialize];
    }
    return self;
}

-(void)initialize{
    
    self.backgroundColor = RANDOMCOLOR;
}

+(CGSize)calculateSize:(id)data
{
    //    if(!data || ![data isKindOfClass:[NSArray class]]) {
    //        return CGSizeMake(0, 0);
    //    }
    
    return CGSizeMake(SCREENWIDTH, 145*SCREENWIDTH/375.0f);
    
}
@end
