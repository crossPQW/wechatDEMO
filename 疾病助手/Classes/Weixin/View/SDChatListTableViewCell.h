//
//  SDChatListTableViewCell.h
//  疾病助手
//
//  Created by 黄少华 on 15/5/11.
//  Copyright (c) 2015年 NXAristotle. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SDChatListTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UILabel *theme;
@property (weak, nonatomic) IBOutlet UILabel *descri;
@property (weak, nonatomic) IBOutlet UILabel *time;

+ (instancetype)cellWithTableView:(UITableView *)tableView;
@end
