//
//  KLCodeResignView.h
//  Test
//
//  Created by 叶义峰 on 2021/5/7.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef void (^CodeResignCompleted)(NSString *content);
typedef void (^CodeResignUnCompleted)(NSString *content);

@interface KLCodeResignView : UIView
@property (copy, nonatomic) CodeResignCompleted codeResignCompleted;
@property (copy, nonatomic) CodeResignUnCompleted codeResignUnCompleted;

- (instancetype) initWithCodeBits:(NSInteger)codeBits;
- (void)setCodeText:(NSString*)text;
@end

NS_ASSUME_NONNULL_END
