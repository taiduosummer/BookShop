//
//  UIView+Corner.m
//  MOI
//
//  Created by chenpeng on 16/7/14.
//  Copyright © 2016年 ac. All rights reserved.
//

#import "UIView+Corner.h"

@implementation UIView(Corner)

- (void)rt_cornerRadius:(CGFloat)corners{
    CGRect rectFrame = self.frame;
    CGFloat kWidth = rectFrame.size.width;
    CGFloat kHight = rectFrame.size.height;
    
    if (corners > kWidth/2 || corners > kHight/2){
        if (kWidth > kHight) {
            corners = kHight/2;
        }else{
            corners = kWidth/2;
        }
    }
    
    UIBezierPath *pathLayer = [UIBezierPath bezierPath];
    [pathLayer moveToPoint:CGPointMake(0, corners)];
    [pathLayer addArcWithCenter:CGPointMake(corners, corners) radius:corners startAngle:M_PI endAngle:1.5*M_PI clockwise:YES];
    
    [pathLayer addLineToPoint:CGPointMake(kWidth - corners, 0)];
    [pathLayer addArcWithCenter:CGPointMake(kWidth - corners, corners) radius:corners startAngle:1.5*M_PI endAngle:2*M_PI clockwise:YES];
    
    [pathLayer addLineToPoint:CGPointMake(kWidth, kHight - corners)];
    [pathLayer addArcWithCenter:CGPointMake(kWidth - corners, kHight - corners) radius:corners startAngle:0 endAngle:0.5*M_PI clockwise:YES];
    
    [pathLayer addLineToPoint:CGPointMake(corners, kHight)];
    [pathLayer addArcWithCenter:CGPointMake(corners, kHight - corners) radius:corners startAngle:0.5*M_PI endAngle:M_PI clockwise:YES];
    
    [pathLayer closePath];
    
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.path = pathLayer.CGPath;
    self.layer.mask = maskLayer;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end




