//
//  DHHome_CellModel.h
//  SegmentAndPage
//
//  Created by fubang on 2017/11/14.
//  Copyright © 2017年 fubang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface DHHome_CellModel : NSObject

@property (nonatomic,retain) NSString *selectorString;
@property (nonatomic,strong) NSString *className;
@property (nonatomic,strong) NSString *reuseIdentifier;
@property (nonatomic,assign) CGSize size;
@property (nonatomic,weak) id delegate;
@property (nonatomic,strong) id userInfo;


@end
