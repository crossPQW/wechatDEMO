//
//  UIColor+HexColor.h
//  ZeeReadBookStore
//
//  Created by 史占英 on 14-6-4.
//  Copyright (c) 2014年 ZeeGuo Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (HexColor)
/*!
 * @method 通过16进制计算颜色
 * @abstract
 * @discussion
 * @param 16机制
 * @result 颜色对象
 */
+ (UIColor *)colorFromHexRGB:(NSString *)inColorString;
@end
