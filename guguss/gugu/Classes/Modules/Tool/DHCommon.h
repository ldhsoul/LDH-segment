//
//  DHCommon.h
//  01sinaWeibo
//
//  Created by mac on 16/12/7.
//  Copyright © 2016年 ldh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIView+EXTENSION.h"

#define APIHEAD @"http://192.168.11.20/apiece"

#define RANDOMCOLOR [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1.0]
#define RGB(__r, __g, __b)  [UIColor colorWithRed:(1.0*(__r)/255)\
green:(1.0*(__g)/255)\
blue:(1.0*(__b)/255)\
alpha:1.0]


// 预处理：在你编译之前，就会把你里面的代码取代掉
#ifdef DEBUG
// 调试状态的时候

#define DHLog(...) NSLog(__VA_ARGS__)  // 就是让DHLog 拥有NSLog的能力

#else  //RELEASE 发布
// 发布 状态的时候
#define DHLog(...) // 让CPLog不能使用



#endif


#define KEYWINDOW [UIApplication sharedApplication].keyWindow

#define SCREENBOUNDS   [UIScreen mainScreen].bounds

#define SCREENWIDTH  [UIScreen mainScreen].bounds.size.width

#define DHNotificationCenter [NSNotificationCenter defaultCenter]

#define DHEmotionButtonDidClickedNotification @"DHEmotionButtonDidClickedNotification"
#define DHEmotionButtonFaceIconModelUserinfoKey @"DHEmotionButtonFaceIconModelUserinfoKey"
#define DHDeleteButtonDidClickedNotification @"DHDeleteButtonDidClickedNotification"

#define DHTableScrollViewSwitchNotification @"DHTableScrollViewSwitchNotification"
#define DHCurrentPageUserinfoKey @"DHCurrentPageUserinfoKey"

#define DHAudioScrollViewSwitchNotification @"DHAudioScrollViewSwitchNotification"
#define DHAudioCurrentPageUserinfoKey @"DHAudioCurrentPageUserinfoKey"

#define DHLoginNotification @"DHLoginNotification"

#define DHDateChangeNotification @"DHDateChangeNotification"
#define DHDatePickerDateUserinfoKey @"DHDatePickerDateUserinfoKey"

#define DHRecodePlayClickedNotification @"DHRecodePlayClickedNotification"

