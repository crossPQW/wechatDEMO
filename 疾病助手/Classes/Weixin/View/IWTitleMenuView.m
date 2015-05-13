//
//  IWTitleMenuView.m
//  9期微博
//
//  Created by teacher on 14-9-29.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "IWTitleMenuView.h"

@implementation IWTitleMenuView

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    // 1.创建图片
    
     UIImage *image = [UIImage imageNamed:@"popover_background"];
    CGSize imageSize = image.size;
    image = [image stretchableImageWithLeftCapWidth: imageSize.width topCapHeight:0.5 * imageSize.height];
//     因为绘制的目标范围很大, 所以图片会自动拉伸
//     2.将图片绘制到view上
    [image drawInRect:rect];
}


@end
