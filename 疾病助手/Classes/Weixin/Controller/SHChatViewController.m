//
//  SHChatViewController.m
//  疾病助手
//
//  Created by 黄少华 on 15/5/12.
//  Copyright (c) 2015年 NXAristotle. All rights reserved.
//

#import "SHChatViewController.h"
#import "SHMessageFrame.h"
#import "SHMessage.h"
#import "SHChatTableViewCell.h"
#import "SHToolView.h"
#import "IWPopMenuView.h"
@interface SHChatViewController ()<UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate>

@property (nonatomic, strong) NSMutableArray *messageFrames;

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) SHToolView *toolView;
@end

@implementation SHChatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITableView *tableVIew = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 64 - 45)];
    [self.view addSubview:tableVIew];
    self.tableView = tableVIew;
    tableVIew.delegate = self;
    tableVIew.dataSource = self;
    tableVIew.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableVIew.backgroundColor = [UIColor colorWithRed:234/255.0f green:234/255.0f blue:234/255.0f alpha:1.f];
    tableVIew.allowsSelection = NO;
    
    UITapGestureRecognizer *tap =[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapClick)];
    [self.tableView addGestureRecognizer:tap];
    
    NSArray *array = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"messages" ofType:@"plist"]];
    NSString *previousTime = nil;
    
    for (NSDictionary *dict in array) {
        SHMessageFrame *messageFrame = [[SHMessageFrame alloc] init];
        SHMessage *message = [[SHMessage alloc] init];
        message.dict = dict;
        messageFrame.showTime = ![previousTime isEqualToString:message.time];
        messageFrame.message = message;
        previousTime = message.time;
        [self.messageFrames addObject:messageFrame];
    }
    
    [self loadToolView];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
}

- (void)keyboardWillShow:(NSNotification *)noti
{
    CGFloat duration = [noti.userInfo[UIKeyboardAnimationDurationUserInfoKey] floatValue];
    CGRect keyboadrFrame = [noti.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    
    CGFloat keyboardHeight = keyboadrFrame.size.height;
    
    [UIView animateKeyframesWithDuration:duration delay:0 options:7 << 16 animations:^{
        self.view.transform = CGAffineTransformMakeTranslation(0, -keyboardHeight);
    } completion:nil];
}

- (void)keyboardWillHide:(NSNotification *)note
{
    // 1.取出动画时间
    CGFloat duration = [note.userInfo[UIKeyboardAnimationDurationUserInfoKey] floatValue];
    [UIView animateWithDuration:duration delay:0 options:7 << 16 animations:^{
        self.view.transform = CGAffineTransformIdentity;
    } completion:nil];
}

- (void)loadToolView
{
    SHToolView *toolView = [SHToolView toolView];
    [self.view addSubview:toolView];
    toolView.inputField.delegate = self;
    toolView.frame = CGRectMake(0, CGRectGetMaxY(self.tableView.frame), [UIScreen mainScreen].bounds.size.width, 45);
}

- (void)tapClick
{
    NSLog(@"tapClick");
    [self.view endEditing:YES];
}

- (void)addMessageWithContent:(NSString *)content time:(NSString *)time{
    
    SHMessageFrame *mf = [[SHMessageFrame alloc] init];
    SHMessage *msg = [[SHMessage alloc] init];
    msg.content = content;
    msg.time = time;
    msg.icon = @"icon01.png";
    msg.type = MessageTyeMe;
    mf.message = msg;
    
    [self.messageFrames addObject:mf];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"11111");
    [self.toolView.inputField resignFirstResponder];
    [self.view endEditing:YES];
}

/**
 *  长按事件
 *
 *  @param longPressGesture 长按手势
 */
- (void)longPressGesture:(UILongPressGestureRecognizer *)longPressGesture
{
    if (longPressGesture.state == UIGestureRecognizerStateBegan) {
        SHChatTableViewCell *cell = (SHChatTableViewCell *)longPressGesture.view;
        [cell becomeFirstResponder];
        
        UIMenuItem *copyItem    = [[UIMenuItem alloc] initWithTitle:@"复制" action:@selector(cellCopy)];
        UIMenuItem *retweetItem = [[UIMenuItem alloc] initWithTitle:@"转发" action:@selector(cellRewteet)];
        UIMenuItem *collectItem = [[UIMenuItem alloc] initWithTitle:@"收藏" action:@selector(cellCollect)];
        UIMenuItem *moreItem    = [[UIMenuItem alloc] initWithTitle:@"更多" action:@selector(cellMore)];
        
        UIMenuController *menu = [UIMenuController sharedMenuController];
        [menu setMenuItems:[NSArray arrayWithObjects:copyItem,retweetItem,collectItem,moreItem, nil]];
        [menu setTargetRect:cell.contentBtn.frame inView:cell];
        [menu setMenuVisible:YES animated:YES];
    }
}
                                  
- (void)cellCopy
{
    NSLog(@"复制");
}

- (void)cellRewteet
{
    NSLog(@"转发");
}

- (void)cellCollect
{
    NSLog(@"收藏");
}

- (void)cellMore
{
    NSLog(@"更多");
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.messageFrames.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static  NSString *ID = @"cell";
    SHChatTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[SHChatTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    cell.messageFrame = self.messageFrames[indexPath.row];
    
    UILongPressGestureRecognizer *longaPressGesture = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressGesture:)];
    [cell addGestureRecognizer:longaPressGesture];
    
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return [self.messageFrames[indexPath.row] cellHeight];
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self.view endEditing:YES];
}


- (NSMutableArray *)messageFrames
{
    if (_messageFrames == nil) {
        _messageFrames = [NSMutableArray array];
    }
    return _messageFrames;
}

@end
