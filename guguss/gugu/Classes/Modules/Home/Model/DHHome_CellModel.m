//
//  DHHome_CellModel.m
//  SegmentAndPage
//
//  Created by fubang on 2017/11/14.
//  Copyright © 2017年 fubang. All rights reserved.
//

#import "DHHome_CellModel.h"

@implementation DHHome_CellModel
-(instancetype)init {
    self = [super init];
    if(self) {
        self.reuseIdentifier = [[NSUUID UUID] UUIDString];
    }
    return self;
}
@end
