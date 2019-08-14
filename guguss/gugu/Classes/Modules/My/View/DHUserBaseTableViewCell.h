//
//  DHUserBaseTableViewCell.h
//  MY
//
//  Created by fubang on 2017/7/19.
//  Copyright © 2017年 fubang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DHUserBaseTableViewCell : UITableViewCell

-(void)fillData:(id)data;
+(CGFloat)calculateHeightWithData:(id)data;

@end
