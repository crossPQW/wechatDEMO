//
//  NXTabBarController.h
//  疾病助手
//
//  Created by linyibin on 14/12/18.
//  Copyright (c) 2014年 NXAristotle. All rights reserved.
//

#import <UIKit/UIKit.h>
@class NXTabBar;

@class NXTabBarButton;
@interface NXTabBarController : UITabBarController

@property (nonatomic, weak) NXTabBar *customTabBar;

- (void)tabBarClickNXTabbarButtonNew;
@end
