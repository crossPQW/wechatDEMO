//
//  NXTools.h
//  疾病助手
//
//  Created by linyibin on 15/3/5.
//  Copyright (c) 2015年 NXAristotle. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import "Reachability.h"

@interface NXTools : NSObject

//typedef enum {
//    NXConnectionTypeNone = 0,
//    NXConnectionTypeWiFi,
//    NXConnectionType3G
//} NXConnectionType;
//
///** 连接状态 */
//+ (NXConnectionType)connectionType;

/**
 *  获取机器的UUID
 */
+ (NSString *)getIMEIString;
/**
 *  用颜色创建图片
 */
+ (UIImage*)createImageWithColor: (UIColor*) color;
/**
 *  返回当前时间戳字符串
 */
+ (NSString *)timeSp;

/**
 *  根据传入的字符串时间，返回一个时间戳
 *
 *  @param timeStr 要转换的字符串时间
 *
 *  @return 返回的时间戳
 */
+ (NSString *)timeStr:(NSString *)timeStr;
@end
