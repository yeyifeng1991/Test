//
//  TestShared.m
//  Test
//
//  Created by 叶义峰 on 2021/4/8.
//

#import "TestShared.h"

@implementation TestShared

static TestShared * singleton = nil;
static dispatch_once_t onceToken;
- (instancetype)init
{
    self = [super init];
    if (self) {
        NSLog(@"-- 调用了init方法 --");
    }
    return self;
}

+(instancetype _Nullable )shareInstance;
{

    dispatch_once(&onceToken, ^{
        singleton = [[TestShared alloc]init];
        NSLog(@"---singleton执行----");
    });
    return singleton;
}
- (void)caculate
{
    self.testCount += 1;
    NSLog(@"%ld",self.testCount);
}

- (void)dealloc
{
    NSLog(@"%s", __func__);
}

+ (void)destory;
{
    singleton = nil;
}
@end
