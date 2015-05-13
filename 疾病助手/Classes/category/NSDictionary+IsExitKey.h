//
//  NSDictionary+IsExitKey.h
//  MotherBaby
//
//  Created by Mac_ZL on 14-7-11.
//  Copyright (c) 2014年 YuanFan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary(isExitKey)

-(NSString *)utilityObjectForKey:(NSString *)key;
-(BOOL)isExitKey:(NSString *)key;
@end
