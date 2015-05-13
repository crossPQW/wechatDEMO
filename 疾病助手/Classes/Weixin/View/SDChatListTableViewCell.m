//
//  SDChatListTableViewCell.m
//  疾病助手
//
//  Created by 黄少华 on 15/5/11.
//  Copyright (c) 2015年 NXAristotle. All rights reserved.
//

#import "SDChatListTableViewCell.h"

@implementation SDChatListTableViewCell


+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *cellID = @"listID";
    SDChatListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"SDChatListTableViewCell" owner:nil options:nil] lastObject];
    }
    return cell;
}


@end
