//
//  WDTextField.h
//  Test
//
//  Created by 叶义峰 on 2021/5/18.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class WDTextField;
@protocol WDTextFieldDelegate<NSObject>
- (void)wd_textFieldDeleteBackward:(WDTextField *)textField;
@end


@interface WDTextField : UITextField
@property (nonatomic, assign) id <WDTextFieldDelegate> wd_delegate;

@end

NS_ASSUME_NONNULL_END
