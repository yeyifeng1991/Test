//
//  TestData.h
//  Test
//
//  Created by 叶义峰 on 2021/5/11.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TestManager : NSObject
+ (instancetype)sharedInstance;
@property (nonatomic,assign) BOOL isSending; // 是否发送中
@property (nonatomic, assign) NSInteger indexTime; // 验证码倒计时
@end

NS_ASSUME_NONNULL_END
