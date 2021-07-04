//
//  UIButton+IANActivityView.m
//  IANActivityIndicatorButton
//
//  Created by ian on 15/7/21.
//  Copyright (c) 2015年 ian. All rights reserved.
//

#import "UIButton+IANActivityView.h"
#import <QuartzCore/QuartzCore.h>


static NSUInteger const indicatorViewSize = 20;
static NSUInteger const indicatorViewTag  = 999;

@implementation UIButton (IANActivityView)

- (void)startButtonActivityIndicatorView
{
    self.backgroundColor = [self.backgroundColor colorWithAlphaComponent:0.4];
    self.enabled = NO;
    UIActivityIndicatorView *indicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
  
//    获取按钮文字占用的fame
    CGRect rect = [self.currentTitle boundingRectWithSize:CGSizeMake(self.bounds.size.width, self.bounds.size.height) options:(NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading) attributes:@{NSFontAttributeName:self.titleLabel.font} context:nil];
    CGSize p = CGRectIntegral(rect).size;
    
    
//    indicatorView.frame = CGRectMake(self.bounds.size.width/2 - p.width/2 - indicatorViewSize -5, self.bounds.size.height/2 - indicatorViewSize/2, indicatorViewSize, indicatorViewSize);
//    indicatorView.tag = indicatorViewTag;
//    indicatorView.hidesWhenStopped = YES;
//    [self addSubview:indicatorView];
//    [indicatorView startAnimating];
    
    UIImageView * smallView = [[UIImageView alloc] initWithFrame:CGRectMake(self.bounds.size.width/2 - p.width/2 - indicatorViewSize -5, self.bounds.size.height/2 - indicatorViewSize/2, indicatorViewSize, indicatorViewSize)];
    smallView.image = [UIImage imageNamed:@"ic_加载中"];
//    smallView.backgroundColor = [UIColor cyanColor];
    smallView.tag = indicatorViewTag;
    [self addSubview:smallView];
    [self runSpinAnimationOnView:smallView duration:1 rotations:1 repeat:HUGE_VALF];
}

-(void)runSpinAnimationOnView:(UIView*)view duration:(CGFloat)duration rotations:(CGFloat)rotations repeat:(float)repeat {
   CABasicAnimation* rotationAnimation;
   rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
   rotationAnimation.toValue = [NSNumber numberWithFloat: M_PI * 2.0 /* full rotation*/ * rotations * duration];// fromValue表示动画的起始位置 toValue表示动画的结束位置
   rotationAnimation.duration = duration; // 一次动画持续的时间
   rotationAnimation.cumulative = YES; // 是否累计增加
   rotationAnimation.repeatCount = repeat ? HUGE_VALF : 0;  // HUGE_VALF 重复 是否重复
//    basicAnimation.beginTime = CACurrentMediaTime()+3;
//    kCAFillModeForwards：表示动画结束之后，保持状态不变
// kCAFillModeBackwards：表示在动画开始之前，只要layer被加入了一个动画，即使动画还没有开始（beginTime属性设置了延时），layer也会马上进入动画状态。有一个fromValue的属性，此时layer会马上进入fromValue所在的位置。
//    kCAFillModeBoth：同时有kCAFillModeForwards和kCAFillModeBackwards的效果。
//    kCAFillModeRemoved：表示动画结束之后，恢复到动画之前的状态。效果和kCAFillModeForwards正好相反。

   [view.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
}

- (void)endButtonActivityIndicatorView
{
//    UIActivityIndicatorView *indicatorView = (UIActivityIndicatorView *)[self viewWithTag:indicatorViewTag];
//    [indicatorView removeFromSuperview];
    
        UIImageView *indicatorView = (UIImageView *)[self viewWithTag:indicatorViewTag];
        [indicatorView removeFromSuperview];
//    self.enabled = YES;
//    self.backgroundColor = [self.backgroundColor colorWithAlphaComponent:0.4*(5/2)];
    
    
}


@end
