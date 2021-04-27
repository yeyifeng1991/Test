//
//  TestBaseViewController.h
//  Test
//
//  Created by 叶义峰 on 2021/4/7.
//

#import <UIKit/UIKit.h>
#import "TestSuperBaseViewController.h"
#import "TestView.h"

NS_ASSUME_NONNULL_BEGIN

@interface TestBaseViewController : TestSuperBaseViewController

//@property (nonatomic, strong) NSTimer * oneTimer;
//@property (nonatomic, strong) NSTimer * twoTimer;
@property (nonatomic ,strong) UILabel * superLabel;
@property (nonatomic ,strong) UILabel * superLabel1;
@property (nonatomic ,strong) UILabel * superLabel2;

@property (nonatomic,strong) UITableView * tableView;

@property (nonatomic, strong) NSMutableDictionary *iMvVideoDic; // 拖动视频top left 等信息

- (void)updateMvVideoForPeerID:(NSString *)aPeerId;
- (void)addSubView:(TestView*)subview superView:(UIView*)superview;
- (void)subClick;



@end

NS_ASSUME_NONNULL_END
