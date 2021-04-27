//
//  PersonProtocol.h
//  Test
//
//  Created by 叶义峰 on 2021/3/27.
//  创建protocol 选择 object- file

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol PersonProtocol <NSObject>
- (void)setNameText:(NSString *)nameText;

@end

NS_ASSUME_NONNULL_END
