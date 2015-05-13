//
//  NXNavigationViewController.m
//  疾病助手
//
//  Created by linyibin on 14/12/18.
//  Copyright (c) 2014年 NXAristotle. All rights reserved.
//

#import "NXNavigationViewController.h"
#import "NXTabBar.h"
#import "NXTools.h"


@interface NXNavigationViewController ()

@end

@implementation NXNavigationViewController

+ (void)initialize
{
    //  1. 设置导航条的主题
    [self setupNavTheme];
    
    //  2. 设置导航条按钮的主题
    [self setupItemTheme];
}

/**
 *  设置导航条按钮的主题
 */
+ (void)setupItemTheme
{
    UIBarButtonItem *item = [UIBarButtonItem appearance];
    
    if (!iOS7) {
        //  1. 设置背景图片
        [item setBackgroundImage:[UIImage imageNamed:@"navigationbar_button_background"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
        
    }
    //  2. 设置文字颜色
    //  2.1 设置默认状态的文字颜色
    NSMutableDictionary *norMd = [NSMutableDictionary dictionary];
    norMd[UITextAttributeTextColor] = [UIColor colorFromHexRGB:@"333333"];
    
    //  去除阴影
    norMd[UITextAttributeTextShadowOffset] = [NSValue valueWithUIOffset:UIOffsetZero];
    norMd[UITextAttributeFont] = [UIFont systemFontOfSize:16];
    [item setTitleTextAttributes:norMd forState:UIControlStateNormal];
    
    //  2.2 设置高亮状态的文字颜色
    NSMutableDictionary *higMd = [NSMutableDictionary dictionaryWithDictionary:norMd];
    higMd[UITextAttributeTextColor] = [UIColor redColor];
    [item setTitleTextAttributes:higMd forState:UIControlStateHighlighted];
    
    //  2.3 设置返回按钮图片
    [item setBackButtonBackgroundImage:[UIImage imageNamed:@"navigationbar_back"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    
    //  3. 设置按钮（全局）的渲染颜色
    item.tintColor = [UIColor colorFromHexRGB:@"999999"];
}

/**
 *  设置导航条的主题
 */
+ (void)setupNavTheme
{
    UINavigationBar *navBar = [UINavigationBar appearance];
    
    //  设置文字样式
    NSMutableDictionary *md = [NSMutableDictionary dictionary];
    
    if (!iOS7) {
        //  设置背景
        [navBar setBackgroundImage:[UIImage imageNamed:@"navigationbar_background"] forBarMetrics:UIBarMetricsDefault];
        
        //  设置文字颜色
        //        NSMutableDictionary *md = [NSMutableDictionary dictionary];
        md[UITextAttributeTextColor] = [UIColor colorFromHexRGB:@"333333"];
        
        //  去除阴影
        md[UITextAttributeTextShadowOffset] = [NSValue valueWithUIOffset:UIOffsetZero];
        
    }else{
    
        //  设置导航栏的背景颜色
       [navBar setBackgroundImage:[NXTools createImageWithColor:[UIColor colorFromHexRGB:@"f9f9f9"]] forBarMetrics:UIBarMetricsDefault];
    }
    
   
    if (414.0 == screenWidth) { //  6 plus title的字体特别处理
         md[NSFontAttributeName] = [UIFont systemFontOfSize:20];
    }else{
         md[NSFontAttributeName] = [UIFont systemFontOfSize:17];
    }
    [navBar setTitleTextAttributes:md];
    
}



- (void)viewDidLoad {
    [super viewDidLoad];
    //  清空手势代理
    self.interactivePopGestureRecognizer.delegate = nil;
    
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    
    // 设置目标控制器隐藏选项卡
    if (self.childViewControllers.count > 0) {
        //  不是栈底控制器, 也就是子控制器
        viewController.hidesBottomBarWhenPushed = YES;
        

        //  设置左上角的按钮
        viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithNorImage:@"navigationbar_back" higImage:@"navigationbar_back_highlighted" targe:self action:@selector(back)];
    }
    
    [super pushViewController:viewController animated:YES];
}

/**
 *  返回上一个控制器
 */
- (void)back
{
    [self popViewControllerAnimated:YES];
}
/**
 *  返回栈底控制器
 */
- (void)more
{
    [self popToRootViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(NSArray *)popToRootViewControllerAnimated:(BOOL)animated
{
    NSArray * array=[super popToRootViewControllerAnimated:YES];
    
    for (UIView *subView in self.tabBarController.tabBar.subviews)
    {
        if (![subView isKindOfClass:[NXTabBar class]]) {
            if (![subView isKindOfClass:[UIImageView class]]) { //  不删除系统的TabBar顶部黑线
                [subView removeFromSuperview];
            }
            
        }
    }
    return array;
}
@end
