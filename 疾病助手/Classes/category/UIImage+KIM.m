//
//  UIImage+KIM.m
//  Weibo
//
//  Created by Kim on 14-11-25.
//
//

#import "UIImage+KIM.h"

@implementation UIImage (KIM)


+(UIImage *)resizingImage:(NSString *)named
{
  
        UIImage *normol = [UIImage imageNamed:named];
        CGFloat w = normol.size.width*0.5;
        CGFloat h = normol.size.height*0.5;
    
        return [normol stretchableImageWithLeftCapWidth:w topCapHeight:h];

}

@end
