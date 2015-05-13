//
//  NXTabBar.m
//  疾病助手
//
//  Created by linyibin on 14/12/18.
//  Copyright (c) 2014年 NXAristotle. All rights reserved.
//

#import "NXTabBar.h"
#import "NXTabBarButton.h"
#import "NXBagValue.h"


@interface NXTabBar ()
/** 选项卡数量 */
@property (nonatomic, strong) NSMutableArray *tabBarButtons;

@property (nonatomic,weak)NXTabBarButton *currentSelectedBtn;
/** 第三个item（发现模块） */
@property (nonatomic,weak)NXTabBarButton *specialTabBarButton;
@end

@implementation NXTabBar


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //  设置背景
        [self setupBg];
     
    }
    return self;
}
/**
 *  设置背景
 */
- (void)setupBg
{
    if (iOS7) {
        self.backgroundColor = [UIColor whiteColor];
    }else
    {
        // 设置背景图片
        self.backgroundColor = [UIColor colorFromHexRGB:@"f9f9f9"];
    }
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    //  设置选项卡按钮的frame
    [self setupTabBarBtnFrame];
    
}

/**
 *  设置选项卡按钮的frame
 */
- (void)setupTabBarBtnFrame
{
    NSUInteger count = self.tabBarButtons.count;
    CGFloat btnWidth = self.bounds.size.width / count;
    CGFloat btnHeight = self.bounds.size.height;
    
    for (int i = 0; i < count; i++) {
        //  1. 取出对应的按钮
        NXTabBarButton *btn = self.tabBarButtons[i];
        btn.tag = i;
        //  2. 计算frame
        CGFloat btnW = btnWidth;
        CGFloat btnH = btnHeight;
        CGFloat btnY = 0;
        CGFloat btnX = i * btnW;
        
        //  3. 设置frame
        btn.frame = CGRectMake(btnX, btnY, btnW, btnH);
        if(i == 2){
          
            [self btnOnClick:btn];
        }
        //  消息提醒
        if (3 == i) {
            //TODO: 在此做bageValue的处理逻辑
#warning 在此做bageValue的处理逻辑
            [btn setbageValue:@"0"];
            self.specialTabBarButton = btn;
            
            
        }
    }
}


- (void)addTabBarButton:(UITabBarItem *)item
{
    
    //  1. 创建按钮
    NXTabBarButton*btn = [[NXTabBarButton alloc] init];
    btn.item = item;
    
    //  btn.tag = self.tabBarButtons.count;
    
    //  2. 添加按钮监听事件
    [btn addTarget:self action:@selector(btnOnClick:) forControlEvents:UIControlEventTouchDown];
    
    //  3. 添加选项卡到自定义tabbar
    [self addSubview:btn];
    
    //  4. 添加当前的按钮到数组中
    [self.tabBarButtons addObject:btn];
    
    //  5. 判断是否是第0个按钮
    if (self.tabBarButtons.count == 0) {
        // 第一个按钮
        [self btnOnClick:btn];
    }
    
}



- (void)btnOnClick:(NXTabBarButton *)btn
{
    //  0. 通知代理
    if ([self.delegate respondsToSelector:@selector(tabBar:from:to:)]) {
        
        [self.delegate tabBar:self from:self.currentSelectedBtn.tag to:btn.tag];
    }
    
    //  1. 取消选中上一次选中的按钮
    self.currentSelectedBtn.selected = NO;
    
    //  2. 选中当前的按钮
    btn.selected = YES;
    
    //  3. 记录当前选中的按钮
    self.currentSelectedBtn = btn;
   
}
#warning mark - 暂时处理
- (void)btnOnClickNew{
    NXTabBarButton *btn = self.currentSelectedBtn;
    //  0. 通知代理
    if ([self.delegate respondsToSelector:@selector(tabBar:from:to:)]) {
        
        [self.delegate tabBar:self from:self.currentSelectedBtn.tag to:btn.tag];
    }
    
    //  1. 取消选中上一次选中的按钮
    self.currentSelectedBtn.selected = NO;
    
    //  2. 选中当前的按钮
    btn.selected = YES;
    
    //  3. 记录当前选中的按钮
    self.currentSelectedBtn = btn;

}
#pragma mark - 懒加载

- (NSMutableArray *)tabBarButtons
{
    if (!_tabBarButtons) {
        _tabBarButtons = [NSMutableArray array];
    }
    return _tabBarButtons;
}

- (void)awakeFromNib{
    if ([self.delegate respondsToSelector:@selector(tabBarClickNXTabbarButton:)]) {
        [self.delegate tabBarClickNXTabbarButton:(NXTabBarButton *)self.specialTabBarButton];
    }
}


@end
