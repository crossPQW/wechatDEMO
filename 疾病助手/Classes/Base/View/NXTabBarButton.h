//
//  NXTabBarButton.h
//  疾病助手
//
//  Created by linyibin on 14/12/18.
//  Copyright (c) 2014年 NXAristotle. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NXTabBarButton : UIButton

/**
 *  数据模型
 */
@property (nonatomic, strong) UITabBarItem *item;

//获取自定义bageValue值时用
-(void)setbageValue:(NSString *)str;
@end
