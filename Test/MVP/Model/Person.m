//
//  Person.m
//  Test
//
//  Created by 叶义峰 on 2021/3/27.
//

#import "Person.h"

@implementation Person
- (instancetype)initWithFirstName:(NSString *)firstName{
    self = [super init];
    if (self) {
        _firstName = firstName;
    }
    return  self;
}
@end
