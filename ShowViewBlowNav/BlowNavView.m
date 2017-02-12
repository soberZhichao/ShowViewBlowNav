//
//  BlowNavView.m
//  ShowViewBlowNav
//
//  Created by Ken on 2017/2/12.
//  Copyright © 2017年 AIA. All rights reserved.
//

#import "BlowNavView.h"

@implementation BlowNavView

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    CGFloat viewX = 0;
    CGFloat viewY = -200;
    CGFloat viewW = 475;
    CGFloat viewH = 200;

    self.frame = CGRectMake(viewX, viewY, viewW, viewH);
}
- (IBAction)searchBtn:(id)sender
{
    CGFloat duration = 2;
    CGFloat delay = 0.1;
    
    [UIView animateWithDuration:duration delay:delay options:UIViewAnimationOptionCurveEaseInOut animations:^{
        // 恢复到原来的位置
        self.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        
        // 删除控件
        [self removeFromSuperview];
    }];
}

@end
