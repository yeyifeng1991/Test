//
//  TestData.m
//  Test
//
//  Created by 叶义峰 on 2021/5/11.
//

#import "TestManager.h"

@implementation TestManager

+ (instancetype)sharedInstance {
    static TestManager * ins = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        ins = [[super allocWithZone:nil] init];
    });
    return ins;
}




+(id)allocWithZone:(NSZone *)zone{
    return [self sharedInstance];
}
-(id)copyWithZone:(NSZone *)zone{
    return [[self class] sharedInstance];
}
-(id)mutableCopyWithZone:(NSZone *)zone{
    return [[self class] sharedInstance];
}
@end
