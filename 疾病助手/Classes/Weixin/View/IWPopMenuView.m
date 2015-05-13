//
//  IWPopMenuView.m
//  9期微博
//
//  Created by teacher on 14-9-29.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "IWPopMenuView.h"
#import "IWTitleMenuView.h"
#import <POP.h>
@interface IWPopMenuView()
/**
 *  需要显示的内容
 */
@property (nonatomic, strong) UIView *contentView;
/**
 *  蒙版
 */
@property (nonatomic, weak) UIButton *cover;
/**
 *  用于显示内容的容器
 */
@property (nonatomic, weak) IWTitleMenuView *containerView;
@end

@implementation IWPopMenuView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // 1.创建蒙版
        UIButton *cover = [[UIButton alloc] init];
        cover.backgroundColor  = [UIColor clearColor];
        [cover addTarget:self action:@selector(coverClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:cover];
        self.cover = cover;
        
        // 2.创建菜单
       IWTitleMenuView *containerView = [[IWTitleMenuView alloc] init];
       [self addSubview:containerView];
        self.containerView = containerView;
    }
    return self;
}

- (instancetype)initWithContentView:(UIView *)contentView
{
    if (self = [super init]) {
        // 保存需要显示的内容
        self.contentView = contentView;
    }
    return self;
}

+ (instancetype)popMenuViewWithContentView:(UIView *)contentView
{
    return [[self alloc] initWithContentView:contentView];
}

- (void)showWithRect:(CGRect)rect
{
    // 1.获取window
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    // 5.将当前View添加到window中
    [window addSubview:self];
    // 2.设置当前View(自定义菜单)的frame
    self.frame = window.bounds;
    
    // 3.调整内容的位置
    CGFloat contentX = 5;
    CGFloat contentY = 15;
    CGFloat margin = contentX;
    CGFloat contentW = rect.size.width - 2 * margin;
    CGFloat contentH = rect.size.height - contentY - 10;
    self.contentView.frame = CGRectMake(contentX, contentY, contentW, contentH);
    
    // 3.添加需要显示的内容到容器中
    [self.containerView addSubview:self.contentView];
    
    // 4.设置容器的frame
    self.containerView.frame = rect;
}

- (void)dismiss
{
    // 将自己从window中移除
    
//    POPBasicAnimation *positionAnimation = [POPBasicAnimation animationWithPropertyNamed:kPOPViewFrame];
//    positionAnimation.fromValue = [NSValue valueWithCGRect:CGRectMake(320-147, 5, 147, 160)];
//    positionAnimation.toValue = [NSValue valueWithCGRect:CGRectMake(320, 5, 0, 0)];
//    [self pop_addAnimation:positionAnimation forKey:@"frameAnimation"];
    [self removeFromSuperview];
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    // 设置蒙版的frame
    self.cover.frame = self.frame;
}

- (void)coverClick:(UIButton *)cover
{
    
    if ([self.delegate respondsToSelector:@selector(popMenuViewDidClick:)]) {
        [self.delegate popMenuViewDidClick:self];
    }
//    IWLog(@"%s", __func__);
    [self dismiss];
}
@end
