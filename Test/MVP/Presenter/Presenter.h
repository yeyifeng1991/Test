//
//  Presenter.h
//  Test
//
//  Created by 叶义峰 on 2021/3/27.
//

#import <Foundation/Foundation.h>
#import "PersonProtocol.h"
#import "TestView.h"
#import "ViewController.h"
#import "Masonry.h"




NS_ASSUME_NONNULL_BEGIN

@interface Presenter : NSObject
@property (nonatomic,strong) NSString * name;
// 绑定view
- (void)attach:(id <PersonProtocol>)view;
- (void)changeFrame:(TestView *)view;
- (void)remove:(dispatch_block_t)completion;
- (void)updateMvVideoForPeerID:(NSString *)aPeerId originDic:(NSMutableDictionary*)originDic;
- (void)changeDic:(NSMutableDictionary *)originDic block:(void (^_Nullable)(NSMutableDictionary * dic))dicBlock;
- (BOOL)changeStatus:(BOOL)isShow;
- (void)changeGif:(NSMutableDictionary *)originDic;

// 数据处理
- (void)fetchData;

-(UIButton *)serverBtWithTarget:(id)target AddAction:(NSString *)actionName;
- (void)touchBeginClickCompletion:(void (^_Nullable)(void))block;
- (void)touchBeginClickCompletion1:(void (^_Nullable)(int))block;

- (void)handleBtn:(UIButton*)button;

//-(void)touchWithVC:(ViewController*)viewController
//             ClickCompletion1:(void (^)(int))block;
//^(NSString *sel, NSString *name, id obj)
// 函数name ,监听name , 通知参数
- (void)addObserver:(void(^)(NSString * ,NSString *,id ))completion;
- (void)addSubView:(TestView*)subview superView:(UIView*)superview;
- (void)getOutsideAddView:(UIView*)superView btn:(void (^_Nullable)(UIButton * btn,UILabel * lab))blockBtn;

- (void)closeAutoScreen:(UIViewController*)vc;
- (void)aopenAutoScreen:(UIViewController*)vc;

@end

NS_ASSUME_NONNULL_END
