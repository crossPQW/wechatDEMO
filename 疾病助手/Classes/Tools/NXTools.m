//
//  NXTools.m
//  疾病助手
//
//  Created by linyibin on 15/3/5.
//  Copyright (c) 2015年 NXAristotle. All rights reserved.
//

#import "NXTools.h"
//#import "KeychainItemWrapper.h"

@implementation NXTools

//+ (NSString *)getIMEIString{
//    KeychainItemWrapper *wrapper = [[KeychainItemWrapper alloc] initWithIdentifier:@"openudid" accessGroup:nil]  ;
////    [wrapper setObject:[OpenUDID value] forKey:kSecValueData];
//    [wrapper setObject:kUUID forKey:(__bridge id)(kSecValueData)];
//    
//    return [wrapper objectForKey:(__bridge id)(kSecValueData)];
//
//}

/**
 *颜色值转换成图片
 */

+ (UIImage*)createImageWithColor: (UIColor*) color
{
    CGRect rect=CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage*theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    
    return theImage;
}

/**
 *  当前网络的状态&类型
 */
//+ (NXConnectionType)connectionType {
//    NXConnectionType connectionType = NXConnectionTypeNone;
//    Reachability *r = [Reachability reachabilityWithHostName:@"www.baidu.com"];
//    switch ([r currentReachabilityStatus]) {
//        case NotReachable:
//            connectionType = NXConnectionTypeNone;
//            break;
//        case ReachableViaWiFi:
//            connectionType = NXConnectionTypeWiFi;
//            break;
//        case ReachableViaWWAN:
//            connectionType = NXConnectionType3G;
//            break;
//        default:
//            break;
//    }
//    
//    return connectionType;
//}

+ (NSString *)timeSp{
    NSDate *datenow =[NSDate date];
    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    NSInteger interval = [zone secondsFromGMTForDate:datenow];
    NSDate *localeDate = [datenow  dateByAddingTimeInterval: interval];
    NSString *timeSp = [NSString stringWithFormat:@"%zd", (long)[localeDate timeIntervalSince1970]];
//    NXLog(@"timeSp:%@",timeSp); //时间戳的值
    return timeSp;
}

+ (NSString *)timeStr:(NSString *)timeStr{
//    NSString *str=@"2015-03-30 15:24:22";
    NSString *str = timeStr;
    NSDateFormatter *format =[[NSDateFormatter alloc]init];
    
    [format setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    NSDate *date=[format dateFromString:str];
    
    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    NSInteger interval = [zone secondsFromGMTForDate:date];
    NSDate *localeDate = [date  dateByAddingTimeInterval: interval];
    NSString *timeSp = [NSString stringWithFormat:@"%zd", (long)[localeDate timeIntervalSince1970]];
    //    NXLog(@"timeSp:%@",timeSp); //时间戳的值
    return timeSp;
}
@end
