//
//  DHViewController.h
//  MY
//
//  Created by fubang on 2017/7/19.
//  Copyright © 2017年 fubang. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^BKLoginSuccessBlock)(id obj);

@interface DHViewController : UIViewController

@property (nonatomic,strong) BKLoginSuccessBlock block;




@end
