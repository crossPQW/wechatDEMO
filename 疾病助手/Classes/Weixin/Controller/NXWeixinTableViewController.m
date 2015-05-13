//
//  NXWeixinTableViewController.m
//  疾病助手
//
//  Created by linyibin on 15/5/11.
//  Copyright (c) 2015年 NXAristotle. All rights reserved.
//

#import "NXWeixinTableViewController.h"
#import "SDChatListTableViewCell.h"
#import "SHChatViewController.h"
#import "IWPopMenuView.h"
#import <POP.h>
@interface NXWeixinTableViewController ()<IWPopMenuViewDelegate>

@end

@implementation NXWeixinTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeContactAdd];
    [rightBtn addTarget:self action:@selector(showMenu) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightBtn];
}

- (void)showMenu
{
    
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = [UIColor clearColor];
    IWPopMenuView *popMenuView = [IWPopMenuView popMenuViewWithContentView:view];
    popMenuView.delegate = self;
    
    CGFloat popW = 100;
    CGFloat popH = 200;
    CGFloat popX = [UIScreen mainScreen].bounds.size.width - popW - 5;
    CGFloat popY = 64;
    
    [popMenuView showWithRect:CGRectMake(popX,popY,popW,popH)];
    
//    POPSpringAnimation *positionAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPViewFrame];
//    positionAnimation.fromValue = [NSValue valueWithCGRect:popMenuView.frame];
//    positionAnimation.toValue   = [NSValue valueWithCGRect:CGRectMake(100, 100, 300, 400)];
//    positionAnimation.springBounciness = 15.0f;
//    positionAnimation.springSpeed      = 20.0f;
//    [popMenuView pop_addAnimation:positionAnimation forKey:@"frameAnimation"];
    
}

#pragma mark - IWPopMenuViewDelegate
- (void)popMenuViewDidClick:(IWPopMenuView *)popMenuView
{
    
}
//- (void)showPop{
//    
//    if (_isOpened) {
//        [self hidePop];
//        return;
//    }
//    _isOpened = YES;
//    
//    POPSpringAnimation *positionAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPViewFrame];
//    positionAnimation.fromValue = [NSValue valueWithCGRect:_hidePosition];
//    positionAnimation.toValue = [NSValue valueWithCGRect:_showPosition];
//    positionAnimation.springBounciness = 15.0f;
//    positionAnimation.springSpeed = 20.0f;
//    [_popView pop_addAnimation:positionAnimation forKey:@"frameAnimation"];
//}
//
//- (void)hidePop{
//    
//    POPBasicAnimation *positionAnimation = [POPBasicAnimation animationWithPropertyNamed:kPOPViewFrame];
//    positionAnimation.fromValue = [NSValue valueWithCGRect:_showPosition];
//    positionAnimation.toValue = [NSValue valueWithCGRect:_hidePosition];
//    [_popView pop_addAnimation:positionAnimation forKey:@"frameAnimation"];
//    
//    _isOpened = NO;
//}


#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 65;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SDChatListTableViewCell *cell = [SDChatListTableViewCell cellWithTableView:tableView];
    cell.image.image = [UIImage imageNamed:@"EPackageTusijiImage"];
    cell.theme.text = [NSString stringWithFormat:@"第%ld行的标题",(long)indexPath.row];
    cell.descri.text = [NSString stringWithFormat:@"第%ld行的描述",(long)indexPath.row];
    cell.time.text = @"时间";
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    SHChatViewController *chatVc = [[SHChatViewController alloc] init];
    chatVc.title = [NSString stringWithFormat:@"第%ld行",(long)indexPath.row];
    [self.navigationController pushViewController:chatVc animated:YES];
}
@end
