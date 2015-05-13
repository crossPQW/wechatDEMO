//
//  NXTabBarButton.m
//  疾病助手
//
//  Created by linyibin on 14/12/18.
//  Copyright (c) 2014年 NXAristotle. All rights reserved.
//

#import "NXTabBarButton.h"
#import "NXBagValue.h"

@implementation NXTabBarButton

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        //  1. 设置图片居中
        self.imageView.contentMode = UIViewContentModeCenter;
        
        //  2. 设置标题居中
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        
        //  3. 设置标题的大小
        if(iOS7){
            self.titleLabel.font = [UIFont systemFontOfSize:11.7];
        }
        else if(iOS8)
        {
            self.titleLabel.font = [UIFont systemFontOfSize:15];
        }
        else
        {
        self.titleLabel.font = [UIFont systemFontOfSize:10];
        }
        
        //  4. 设置标题默认颜色
        [self setTitleColor:[UIColor colorFromHexRGB:@"999999"] forState:UIControlStateNormal];
        
        //  5. 设置选中状态的颜色
        [self setTitleColor:[UIColor colorFromHexRGB:@"46BB60"]forState:UIControlStateSelected];
    }
    return self;
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat imageX = 0;
//    CGFloat imageY = 0;
    CGFloat imageY = self.height * 0.05;
    CGFloat imageW = self.width;
    CGFloat imageH = self.height * 0.6;
    return CGRectMake(imageX, imageY, imageW, imageH);
}

- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGFloat titleX = 0;
    CGFloat titleY = self.height * 0.65;
    CGFloat titleW = self.width;
//    CGFloat titleH = self.height - titleY;
    CGFloat titleH = self.height * 0.3;
    return CGRectMake(titleX, titleY, titleW, titleH);
}

- (void)setItem:(UITabBarItem *)item
{
    _item = item;
    
    //  1. 设置按钮默认状态的图片
    [self setImage:item.image forState:UIControlStateNormal];
    
    //  2. 设置按钮选中状态的图片
    [self setImage:item.selectedImage forState:UIControlStateSelected];
    
    //  3. 设置按钮的标题
    [self setTitle:item.title forState:UIControlStateNormal];
    
    [_item addObserver:self forKeyPath:@"badgeValue" options:0 context:nil];
    [_item addObserver:self forKeyPath:@"title" options:0 context:nil];
    
    [_item addObserver:self forKeyPath:@"image" options:0 context:nil];
    [_item addObserver:self forKeyPath:@"selectedImage" options:0 context:nil];
    
}

//  监听属性
- (void)addObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath options:(NSKeyValueObservingOptions)options context:(void *)context
{
        [self setbageValue:_item.badgeValue];
    
}

//bageValue
-(void)setbageValue:(NSString *)str
{
    //添加自定义bageValue
    NXBagValue *bage = [[NXBagValue alloc]init];
    bage.str = str;
    [self addSubview:bage];
    
    //没有文字时不显示
    if(str==nil ||str.length == 0|| [str isEqual:@"0"])
    {
        bage.hidden = YES;
    }else
    {
        bage.hidden = NO;
    }
    
}


- (void)setHighlighted:(BOOL)highlighted
{
    //  不实现改方法，取消高亮状态
}

//  删除监听
- (void)dealloc
{
    [self.item removeObserver:self forKeyPath:@"badgeValue"];
    [self.item removeObserver:self forKeyPath:@"title"];
    [self.item removeObserver:self forKeyPath:@"image"];
    [self.item removeObserver:self forKeyPath:@"selectedImage"];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
