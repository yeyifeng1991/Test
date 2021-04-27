//
//  TestShared.h
//  Test
//
//  Created by 叶义峰 on 2021/4/8.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TestShared : NSObject
+(instancetype _Nullable )shareInstance;
@property (nonatomic,assign)BOOL isShow;
@property (nonatomic,assign)NSInteger testCount;
- (void)caculate;
+ (void)destory;
@end

NS_ASSUME_NONNULL_END
