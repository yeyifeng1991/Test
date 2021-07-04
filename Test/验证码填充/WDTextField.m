//
//  WDTextField.m
//  Test
//
//  Created by 叶义峰 on 2021/5/18.
//

#import "WDTextField.h"

@implementation WDTextField

 
- (void)deleteBackward {
    [super deleteBackward];
    
    if ([self.wd_delegate respondsToSelector:@selector(wd_textFieldDeleteBackward:)]) {
        [self.wd_delegate wd_textFieldDeleteBackward:self];
    }
}
@end
