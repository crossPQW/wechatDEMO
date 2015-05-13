//
//  UIBarButtonItem+NX.h
//  疾病助手
//
//  Created by linyibin on 14/12/18.
//  Copyright (c) 2014年 NXAristotle. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (NX)

/**
 *  创建自定义item
 *
 *  @param norImageName 默认状态图片
 *  @param higImageName 高亮状态图片
 *  @param action       点击事件
 *
 *  @return item
 */
+ (instancetype)itemWithNorImage:(NSString *)norImageName higImage:(NSString *)higImageName targe:(id)targe action:(SEL)action;
/**
 *  带标题的item
 *
 *  @param norImageName 默认状态图片
 *  @param higImageName 高亮状态图片
 *  @param title        标题
 *  @param action       点击事件
 *
 *  @return item
 */
+ (instancetype)itemWithNorImage:(NSString *)norImageName higImage:(NSString *)higImageName title:(NSString *)title targe:(id)targe action:(SEL)action;
@end
