//
//  Presenter.m
//  Test
//
//  Created by 叶义峰 on 2021/3/27.
//

#import "Presenter.h"
#import "Person.h"
@interface Presenter()
@property (nonatomic ,strong) Person * p;
// 不知道具体传过来的类型
@property (nonatomic, weak) id<PersonProtocol>attachView;

@end

@implementation Presenter
- (void)attach:(id<PersonProtocol>)view{
    if ([view conformsToProtocol:@protocol(PersonProtocol)]) {
        self.attachView = view;

    }
}

- (void)fetchData{
    self.p = [[Person alloc] initWithFirstName:@"测试案例"];
    [self.attachView setNameText:self.p.firstName];
    
}


- (void)remove:(dispatch_block_t)completion;
{
    if (completion) {
        completion();
    }
}
- (void)changeIsHave:(UIButton*)btn;
{
    if (btn) {
        return;
    }
    NSLog(@"继续操作");
}
- (void)updateMvVideoForPeerID:(NSString *)aPeerId originDic:(NSMutableDictionary*)originDic {
    
    NSDictionary *tVideoViewDic = (NSDictionary *)[originDic objectForKey:aPeerId];
    NSMutableDictionary *tVideoViewDicNew =
    [NSMutableDictionary dictionaryWithDictionary:tVideoViewDic];
    [tVideoViewDicNew setObject:@NO forKey:@"isDrag"];
    [tVideoViewDicNew setObject:@(0) forKey:@"percentTop"];
    [tVideoViewDicNew setObject:@(0) forKey:@"percentLeft"];
    [originDic setObject:tVideoViewDicNew forKey:aPeerId];
}

- (void)changeDic:(NSMutableDictionary *)originDic block:(void (^_Nullable)(NSMutableDictionary * dic))dicBlock
{
    NSDictionary *tVideoViewDic = (NSDictionary *)[originDic objectForKey:@"aPeerId"];
    NSMutableDictionary *tVideoViewDicNew =
    [NSMutableDictionary dictionaryWithDictionary:tVideoViewDic];
    [tVideoViewDicNew setObject:@NO forKey:@"isDrag"];
    [tVideoViewDicNew setObject:@(0) forKey:@"percentTop"];
    [tVideoViewDicNew setObject:@(0) forKey:@"percentLeft"];
    if (dicBlock) {
        dicBlock(tVideoViewDicNew);
    }
}
- (BOOL)changeStatus:(BOOL)isShow;
{
    isShow = YES;
    return  isShow;
}
- (void)handleBtn:(UIButton*)button;
{
    if (button) {
//        [button removeFromSuperview];
        button = nil;
    }
}


- (void)changeGif:(NSMutableDictionary *)originDic;
{
    [originDic setValue:@"2" forKey:@"Test2"];
    [originDic removeObjectForKey:@"Test1"];
}

- (void)getOutsideAddView:(UIView*)superView btn:(void (^_Nullable)(UIButton * btn,UILabel * lab))blockBtn;
{
//     __block 引入内部
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeSystem];
    [btn setTitle:@"随便写的" forState:UIControlStateNormal];
//    btn.frame = CGRectMake(100, 100, 200, 100);
    [superView addSubview:btn];
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        //第一种方法
       make.left.mas_equalTo(superView.mas_left).offset(100);
       make.top.mas_equalTo(superView.mas_top).offset(100);
        make.size.mas_equalTo(CGSizeMake(200, 100));
    }];
    
    
    
    UILabel * label = [[UILabel alloc]init];
//    UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 50, 50)];

    label.text = @"La";
    label.backgroundColor = [UIColor redColor];
    [btn addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(btn);
        make.size.mas_equalTo(CGSizeMake(50, 50));
    }];
    if (blockBtn) {
        blockBtn(btn,label);
    }

}

- (void)changeFrame:(TestView *)view;
{
//    view.frame = CGRectMake(0, 0, 150, 150);
    [view mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(view.superview).insets(UIEdgeInsetsMake(10, 10, 10, 10));
    }];
    

}

- (void)changeBtnFrame:(UIButton *)btn;
{
    [btn mas_updateConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(300, 300));
    }];
}
-(UIButton *)serverBtWithTarget:(id)target AddAction:(NSString *)actionName;
{
    UIButton  *serverBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [serverBtn setTitle:@"服务" forState:UIControlStateNormal];
    serverBtn.tag = 100;
//    NSSelectorFromString
//    [serverBtn addTarget:target action:serAction forControlEvents:UIControlEventTouchUpInside];
    [serverBtn addTarget:target action:NSSelectorFromString(actionName) forControlEvents:UIControlEventTouchUpInside];
    serverBtn.backgroundColor = [UIColor cyanColor];
    return  serverBtn;
}

- (void)touchBeginClickCompletion:(void (^_Nullable)(void))block;
{
//    if (block) {
//        block();
//    }
}
- (void)touchBeginClickCompletion1:(void (^_Nullable)(int))block;
{
    if (block) {
        block(1);
    }
}

- (void)touchWithVC:(ViewController *)viewController ClickCompletion1:(void (^)(int))block{
    if (block) {
//        block(viewController.code);
    }
}
- (void)addObserver:(void(^)(NSString * ,NSString *,id ))completion;
{
    
    if (completion) {
        completion(@"nameSel",@"nameobserver",nil);
        completion(@"nameSel1",@"nameobserver1",nil);
        completion(@"nameSel2",@"nameobserver2",nil);
        completion(@"nameSel3",@"nameobserver3",nil);

    }
}

- (void)addSubView:(TestView*)subview superView:(UIView*)superview;
{
    TestView *tView =  [[TestView alloc] init];
    tView.backgroundColor = [UIColor redColor];
    NSLog(@"setupViews 执行");
    [superview addSubview:tView];
//       make.edges.equalTo(self.view.window).insets(UIEdgeInsetsMake( 0, 0, 0, 0));
    [tView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(self.view.mas_left).offset(5);
//        make.right.equalTo(self.view.mas_right).offset(-5);
//        make.top.equalTo(self.view.mas_top).offset(5);
//        make.bottom.equalTo(self.view.mas_bottom).offset(-5);
//        make.edges.equalTo(superview).insets(UIEdgeInsetsMake(5, 5, 5, 5));
        make.center.equalTo(superview);
//        make.width.equalTo(@(self.view.bounds.size.width/3));
//        make.height.equalTo(@(self.view.bounds.size.height/3));
    }];
    
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.layer.masksToBounds = YES;
    imageView.backgroundColor = [UIColor cyanColor];

    imageView.layer.cornerRadius = 10;
//    imageView.image = image;
    [tView addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(tView).insets(UIEdgeInsetsMake(5, 5, 5, 5));
        make.width.equalTo(@(UIScreen.mainScreen.bounds.size.width / 3));
        make.height.equalTo(@(UIScreen.mainScreen.bounds.size.height / 3));
    }];
    
    [imageView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(UIScreen.mainScreen.bounds.size.width / 7));
        make.height.equalTo(@(UIScreen.mainScreen.bounds.size.height / 7));
    }];
    
    [UIView animateWithDuration:5.0f animations:^{
        [superview setNeedsLayout];
        [superview layoutIfNeeded];
        
    } completion:^(BOOL finished) {
       
        [self removeM:tView];
        
    }];
}


- (void)removeM:(TestView*)tView{
    [tView removeFromSuperview];
}

- (void)closeAutoScreen:(UIViewController*)vc{
    [[UIApplication sharedApplication] addObserver:vc
                                        forKeyPath:@"idleTimerDisabled"
                                           options:NSKeyValueObservingOptionNew
                                           context:nil];
}
- (void)aopenAutoScreen:(UIViewController*)vc{
    @try {
        [[UIApplication sharedApplication] removeObserver:vc forKeyPath:@"idleTimerDisabled"];
    } @catch (NSException *exception) {
        
    } @finally {
        
    }
}
@end
