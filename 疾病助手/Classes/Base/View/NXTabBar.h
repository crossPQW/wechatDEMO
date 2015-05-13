//
//  NXTabBar.h
//  疾病助手
//
//  Created by linyibin on 14/12/18.
//  Copyright (c) 2014年 NXAristotle. All rights reserved.
//

#import <UIKit/UIKit.h>

@class NXTabBar,NXTabBarButton;

@protocol NXTabBarDelegate <NSObject>

@optional
- (void)tabBar:(NXTabBar *)tabBar from:(NSInteger)from to:(NSInteger)to;

- (void)tabBarClickNXTabbarButton:(NXTabBarButton *)tabbarButton;
@end

@interface NXTabBar : UIView


@property (nonatomic,weak)id<NXTabBarDelegate>delegate;


/**
 *  根据模型创建选项卡
 *
 *  @param item 模型数据(标题/默认状态的图片/选中状态的图片)
 */
- (void)addTabBarButton:(UITabBarItem *)item;

/**
 *  点击了第三个item
 */
- (void)btnOnClickNew;
@end
