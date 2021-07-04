//
//  UIButton+ImageAlignmentStyle.h
//  Test
//
//  Created by 叶义峰 on 2021/5/11.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
// 定义一个枚举（包含了四种类型的button）
 typedef NS_ENUM(NSUInteger, TKButtonAlignmentStyle) {
     TKButtonAlignmentStyleTop, // 图片在上，文字在下
     TKButtonAlignmentStyleLeft, // 图片在左，文字在右
     TKButtonAlignmentStyleBottom, // 图片在下，文字在上
     TKButtonAlignmentStyleRight // 图片在右，文字在左
 };


@interface UIButton (ImageAlignmentStyle)

- (void)setButtonImageAlignmentStyle:(TKButtonAlignmentStyle)style
                imageAndLabelSpace:(CGFloat)space;

@end

NS_ASSUME_NONNULL_END
