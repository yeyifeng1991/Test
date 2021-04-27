//
//  Person.h
//  Test
//
//  Created by 叶义峰 on 2021/3/27.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject
//
@property (nonatomic, strong)  NSString * firstName;
- (instancetype)initWithFirstName:(NSString *) firstName;

@end

NS_ASSUME_NONNULL_END
