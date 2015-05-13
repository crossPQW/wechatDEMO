//
//  NXBagValue.m
//  疾病助手
//
//  Created by linyibin on 14/12/22.
//  Copyright (c) 2014年 NXAristotle. All rights reserved.
//

#import "NXBagValue.h"
#import "UIImage+KIM.h"

@implementation NXBagValue


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    
        self.userInteractionEnabled = NO;
     
        [self setBackgroundImage:[UIImage resizingImage:@"main_badge_os7"] forState:UIControlStateNormal];
     
        [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        
        self.titleLabel.font = [UIFont systemFontOfSize:13];
        
        
        
        
    }
    return self;
}

//赋值文字 /文字位置 / 背景框大小
-(void)setStr:(NSString *)str
{
    _str = str;
    NSMutableDictionary *att = [NSMutableDictionary dictionary];
    att[NSFontAttributeName] = [UIFont systemFontOfSize:13];
    CGSize  s = [str sizeWithAttributes:att];
    //文字位置
    self.frame = CGRectMake(44, 0, s.width+10,s.height+2);
    
    //赋值文字
    [self setTitle:_str forState:UIControlStateNormal];
    
}
@end

