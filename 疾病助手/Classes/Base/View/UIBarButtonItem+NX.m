//
//  UIBarButtonItem+NX.m
//  疾病助手
//
//  Created by linyibin on 14/12/18.
//  Copyright (c) 2014年 NXAristotle. All rights reserved.
//

#import "UIBarButtonItem+NX.h"

@implementation UIBarButtonItem (NX)



+ (instancetype)itemWithNorImage:(NSString *)norImageName higImage:(NSString *)higImageName targe:(id)targe action:(SEL)action
{
   
    UIButton *btn = [[UIButton alloc] init];
    //  设置默认状态图片
    [btn setBackgroundImage:[UIImage imageNamed:norImageName] forState:UIControlStateNormal];
    
    //  设置高亮状态图片
    [btn setBackgroundImage:[UIImage imageNamed:higImageName] forState:UIControlStateHighlighted];
    
    //  设置frame
    btn.size = btn.currentBackgroundImage.size;
    
    //  添加监听事件
    [btn addTarget:targe action:action forControlEvents:UIControlEventTouchUpInside];
    
    //  返回item
    return [[UIBarButtonItem alloc] initWithCustomView:btn];
    
}

+ (instancetype)itemWithNorImage:(NSString *)norImageName higImage:(NSString *)higImageName title:(NSString *)title targe:(id)targe action:(SEL)action{
    
    UIButton *btn = [[UIButton alloc] init];
    if (norImageName && higImageName) {
        
        //  设置默认状态图片
        [btn setBackgroundImage:[UIImage imageNamed:norImageName] forState:UIControlStateNormal];
        
        //  设置高亮状态图片
        [btn setBackgroundImage:[UIImage imageNamed:higImageName] forState:UIControlStateHighlighted];
    }
    //  设置标题
    btn.titleLabel.text = title;
    
    //  设置frame
    btn.size = btn.currentBackgroundImage.size;
    
    //  添加监听事件
    [btn addTarget:targe action:action forControlEvents:UIControlEventTouchUpInside];
    
    //  返回item
    return [[UIBarButtonItem alloc] initWithCustomView:btn];
}
@end
