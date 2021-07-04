//
//  UIControl+Limit.h
//  Test
//
//  Created by 叶义峰 on 2021/5/13.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIControl (Limit)
@property (nonatomic,assign) NSTimeInterval acceptEventInterval; // 按钮事件触发时间间隔
@property (nonatomic)BOOL ignoreEvent; // YES 按钮点击事件被拦截 NO可以正常响应
@end

NS_ASSUME_NONNULL_END
