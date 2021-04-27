//
//  TestView.h
//  Test
//
//  Created by 叶义峰 on 2021/3/27.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TestView : UIView
//
@property (nonatomic, strong) UILabel   * nameLabel;
- (void)changeFramerelyView:(UIView*)relyView;
@property (nonatomic,assign) BOOL canTurnPage;

@end

NS_ASSUME_NONNULL_END
