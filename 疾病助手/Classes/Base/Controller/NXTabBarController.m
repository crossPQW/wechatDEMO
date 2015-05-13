//
//  NXTabBarController.m
//  疾病助手
//
//  Created by linyibin on 14/12/18.
//  Copyright (c) 2014年 NXAristotle. All rights reserved.
//

#import "NXTabBarController.h"
#import "NXWeixinTableViewController.h"
#import "NXContactsTableViewController.h"
#import "RoomTableViewController.h" 
#import "DiscoverViewController.h"
#import "PersonalTableViewController.h"
#import "NXNavigationViewController.h"
#import "NXTabBar.h"

@interface NXTabBarController ()<NXTabBarDelegate>



@property (nonatomic, strong)NXWeixinTableViewController *weixin;
@property (nonatomic, strong)NXContactsTableViewController *contacts;
@property (nonatomic, strong)RoomTableViewController *room;
@property (nonatomic, strong)DiscoverViewController *discover;
@property (nonatomic, strong)PersonalTableViewController *personal;
@end

@implementation NXTabBarController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        //  1. 微信
        NXWeixinTableViewController *weixin = [[NXWeixinTableViewController alloc] init];
        weixin.view.backgroundColor = NXRandomColor;
        [self addOneChildController:weixin title:@"微信" norImage:@"tabbar_mainframe" selectedImage:@"tabbar_mainframeHL"];
        self.weixin = weixin;
        
        //  2. 通讯录
        NXContactsTableViewController *contacts = [[NXContactsTableViewController alloc] init];
        [self addOneChildController:contacts title:@"通讯录" norImage:@"tabbar_contacts" selectedImage:@"tabbar_contactsHL"];
        self.contacts = contacts;
        
        //  3. 发现
        DiscoverViewController *discover = [[DiscoverViewController alloc] init];
        
        [self addOneChildController:discover title:@"发现" norImage:@"tabbar_discover" selectedImage:@"tabbar_discoverHL"];
        self.discover = discover;

        //  4. 我
        PersonalTableViewController *personal = [[PersonalTableViewController alloc] init];
        NSString *norImageName = @"tabbar_me";
        NSString *selImageName = @"tabbar_meHL";
        [self addOneChildController:personal title: @"我" norImage:norImageName selectedImage:selImageName];
        self.personal = personal;
        
    }
    return self;
}

/**
 *  初始化子控制器
 *
 *  @param childVc       需要初始化的子控制器
 *  @param title         控制器的标题
 *  @param norImage      控制器的默认状态的图片
 *  @param selectedImage 控制器的选中状态的图片
 */
- (void)addOneChildController:(UIViewController *)childVc title:(NSString *)title norImage:(NSString *)norImage selectedImage:(NSString *)selectedImage
{
    
    childVc.view.backgroundColor = [UIColor colorWithRed:0.93f green:0.93f blue:0.93f alpha:1.00f];
    childVc.title = title;
    
    childVc.tabBarItem.image = [UIImage imageNamed:norImage];
    UIImage *selImage = [UIImage imageNamed:selectedImage];
    
    //  告诉系统不要按照tintColor渲染图片
    //  判断当前是否是ios7
    if (iOS7) {
        selImage = [selImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        
    }
    childVc.tabBarItem.selectedImage = selImage;
    //  包装一个导航条
    NXNavigationViewController  *nav = [[NXNavigationViewController alloc] initWithRootViewController:childVc];
    
    [self addChildViewController:nav];
    
    //  添加一个自定义选项卡按钮
    [self.customTabBar addTabBarButton:childVc.tabBarItem];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];

    //  1. 创建自定义tabBar
    NXTabBar *customTabBar = [[NXTabBar alloc] init];
    customTabBar.frame = self.tabBar.bounds;
    [self.tabBar addSubview:customTabBar];
    self.customTabBar = customTabBar;
    
    //  设置代理
    self.customTabBar.delegate = self;

}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    // 遍历tabbar中所有的子控件, 删除不需要的控件
    // UITabBarButton 这个类是私有API
   
    for (UIView *subView in self.tabBar.subviews) {
               if ([subView isKindOfClass:[UIControl class]]) {
            [subView removeFromSuperview];
        }
    }
   NXLog(@"self.tabBar.subviews=%@",self.tabBar.subviews);
}

#pragma mark - NXTabBarDelegate
- (void)tabBar:(NXTabBar *)tabBar from:(NSInteger)from to:(NSInteger)to
{
    //  切换子控制器
    self.selectedIndex = to;
}

#warning mark - 暂时处理
-(void)tabBarClickNXTabbarButtonNew{
    [self.customTabBar btnOnClickNew];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
