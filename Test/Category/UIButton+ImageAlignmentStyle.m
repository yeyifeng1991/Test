//
//  UIButton+ImageAlignmentStyle.m
//  Test
//
//  Created by 叶义峰 on 2021/5/11.
//

#import "UIButton+ImageAlignmentStyle.h"

@implementation UIButton (ImageAlignmentStyle)
- (void)setButtonImageAlignmentStyle:(TKButtonAlignmentStyle)style
                imageAndLabelSpace:(CGFloat)space {
    /**
    UIButton中titleLabel和imageView的位置依赖:
    如果只有文字(或者图片)时,titleEdgeInsets(或imageEdgeInsets)是button中titleLabel(或imageView)相对于button的上下左右的内边距;
    如果同时有titleLabel和imageView，那么imageView的上下左是相对于button，右边是相对于titleLabel的;
    titleLabel的上下右是相对于button，左边是相对于imageView的。
    */

    // 获取imageView的宽、高
    CGFloat imageWith = self.currentImage.size.width;
    CGFloat imageHeight = self.currentImage.size.height;

    // 获取titleLabel的宽、高
    //intrinsicContentSize:也就是控件的内置大小,比如UILabel,UIButton等控件,
    //他们都有自己的内置大小,控件的内置大小往往是由控件本身的内容所决定的
    CGFloat labelWidth = self.titleLabel.intrinsicContentSize.width;
    CGFloat labelHeight = self.titleLabel.intrinsicContentSize.height;

    // 初始化imageEdgeInsets和labelEdgeInsets
    UIEdgeInsets imageEdgeInsets = UIEdgeInsetsZero;
    UIEdgeInsets labelEdgeInsets = UIEdgeInsetsZero;

    // 根据参数style和space设置imageEdgeInsets和labelEdgeInsets的值
    switch (style) {
        case TKButtonAlignmentStyleTop:
        {
            imageEdgeInsets = UIEdgeInsetsMake(-labelHeight-space/2.0, 0, 0, -labelWidth);
            labelEdgeInsets = UIEdgeInsetsMake(0, -imageWith, -imageHeight-space/2.0, 0);
        }
            break;
        case TKButtonAlignmentStyleLeft:
        {
            imageEdgeInsets = UIEdgeInsetsMake(0, -space/2.0, 0, space/2.0);
            labelEdgeInsets = UIEdgeInsetsMake(0, space/2.0, 0, -space/2.0);
        }
            break;
        case TKButtonAlignmentStyleBottom:
        {
            imageEdgeInsets = UIEdgeInsetsMake(0, 0, -labelHeight-space/2.0, -labelWidth);
            labelEdgeInsets = UIEdgeInsetsMake(-imageHeight-space/2.0, -imageWith, 0, 0);
        }
            break;
        case TKButtonAlignmentStyleRight:
        {
            imageEdgeInsets = UIEdgeInsetsMake(0, labelWidth+space/2.0, 0, -labelWidth-space/2.0);
            labelEdgeInsets = UIEdgeInsetsMake(0, -imageWith-space/2.0, 0, imageWith+space/2.0);
        }
            break;
        default:
            break;
    }
    // 重新设置titleEdgeInsets和imageEdgeInsets
    self.titleEdgeInsets = labelEdgeInsets;
    self.imageEdgeInsets = imageEdgeInsets;
}

@end
