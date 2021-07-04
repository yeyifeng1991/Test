//
//  UserData.h
//  Test
//
//  Created by 叶义峰 on 2021/5/11.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, UserRole) {
    UserTeacher,
    UserStudent,
    MyEnumValueCUserTeacher,
};

NS_ASSUME_NONNULL_BEGIN

@interface UserData : NSObject
@property (nonatomic,assign) NSInteger role; // 角色
@property (nonatomic,assign) NSInteger timeH; // 时长

@end

NS_ASSUME_NONNULL_END
