//
//  ViewController.m
//  Test
//
//  Created by 叶义峰 on 2021/3/27.
//

#import "ViewController.h"
#import "TestBaseViewController+Beauty.h"
#import "TKSDWeakProxy.h"


#import "TestOneViewController.h"

#import "TestView.h"
#import "PersonProtocol.h"
#import "Presenter.h"
#import "Masonry.h"
#import "TestShared.h" //  单例使用
#import "GDPerson.h" // 内存考察


#define TK_Share [TestShared shareInstance]


#define TKDISPATH_ONCE_BLOCK(onceBlock)   static dispatch_once_t onceToken; dispatch_once(&onceToken, onceBlock);
//GCD - 在Main线程上运行
#define  TKDISPTCH_MAIN_THREAD(mainQueueBlock)  dispatch_async(dispatch_get_main_queue(), mainQueueBlock);
//GCD - 开启异步线程
#define TKDISPATCH_BLOBAL_QUEQUE_DEFAULT(globalQueueBlock)  dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), globalQueueBlock);

// 延迟时间
#define TKDisTime(time) dispatch_time(DISPATCH_TIME_NOW, (int64_t)time * NSEC_PER_SEC)

// 延迟执行
#define TKDisMainAfter(disTime,block) dispatch_after(disTime, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void){dispatch_async(dispatch_get_main_queue(), block);});


@interface ViewController ()<PersonProtocol,UITableViewDataSource>

@property (nonatomic,strong) TestView * tView;
@property (nonatomic, strong) Presenter * presenter;
@property (nonatomic, strong) NSTimer * timer;
@property (nonatomic, assign) NSInteger code;
@property (nonatomic, assign) NSInteger codeTwo;
//
@property (nonatomic, strong)  UIView * userlistView;
@property (nonatomic, strong)  UIButton * serverBtn;
@property (nonatomic, strong)  UIButton * outsideBtn;
@property (nonatomic, strong)  UILabel * tipLabel;
@property (nonatomic, strong)  UILabel * subLabel;
@property (nonatomic ,strong)  UILabel * subLabel1;
@property (nonatomic ,strong)  UILabel * subLabel2;


@property (nonatomic, strong)  NSMutableDictionary * dic1;

@property (nonatomic, strong)  TestShared * share;
@property (nonatomic, strong) NSMutableDictionary *usersGiftNum;
@property (nonatomic ,assign) BOOL isShow;
@property (nonatomic, strong) NSMutableArray * dataArray;
@property (nonatomic, strong) NSTimer * oneTimer;
@property (nonatomic, strong) NSTimer * twoTimer;

//拖动进来时的状态





@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.isShow = NO;
    NSString * str = self.isShow?@"真":@"假";
    _oneTimer = [self getTimerWithSel:@selector(timerCountOne)];
    sleep(3);
    self.twoTimer = [self getTimerWithSel:@selector(timerCountTwo)];
    [_twoTimer invalidate];
    _twoTimer = nil;

    if (self.twoTimer) {
        NSLog(@"存在");
    }else{
        NSLog(@"不存在");
    }
    
    NSInteger tag = 3;
    switch (tag) {
        case 0:
            NSLog(@"0");
            break;
        case 1:
            NSLog(@"1");
            break;
        case 2:
            NSLog(@"2");
            break;
        case 3:
            NSLog(@"3");
            break;
        default:
            break;
    }
    
    [self showBeauty:self.isShow];
    NSInteger a = 3;
    BOOL isTemp = NO;
    Presenter * p  = [[Presenter alloc] init];
    self.presenter = p;
    [self.presenter attach:self];
    [self.presenter addObserver:self forKeyPath:@"name" options:(NSKeyValueObservingOptionNew|NSKeyValueObservingOptionNew) context:nil];
    self.dic1 = [NSMutableDictionary dictionaryWithDictionary:@{@"test":@{@"subTest":@"1"}}];
//    self.dic1 = [NSMutableDictionary dictionaryWithDictionary:@{@"test":@"test"}];

    [self.presenter updateMvVideoForPeerID:@"test" originDic:self.dic1];
    
    
//    [self performSelector:@selector(subClick) withObject:nil afterDelay:3];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSLog(@"异步线程你好");
        dispatch_async(dispatch_get_main_queue(), ^{
            NSLog(@"--主线程你好你好--");
        });
    });


//    [self memoryIsa]; // 内存相关
    
//     po [self.view recursiveDescription]
}
- (void)setTwoTimer:(NSTimer *)twoTimer{
    NSLog(@"TwoTimerset方法调用");
}
- (void)timerCountOne{
    self.code += 1;
    if (self.code >= 10) {
        [self.oneTimer invalidate];
        self.oneTimer = nil;
//        [self timerInvalidate:self.oneTimer];
        NSLog(@"one 定时器 销毁");
    }
    NSLog(@"one 定时器 %ld",self.code);
}

- (void)timerCountTwo{
    self.codeTwo += 1;
    if (self.codeTwo >= 10) {
        [self timerInvalidate:self.twoTimer];
        NSLog(@"two 定时器 销毁");
    }
    NSLog(@"two 定时器 %ld",self.codeTwo);
}
// 定时器销毁 作为参数不可消除
- (void)timerInvalidate:(NSTimer*)timer{
    [timer invalidate];
    timer = nil;
}

- (void)subClick{
    NSLog(@"当前子类调用接收到");
    NSLog(@"%s",__func__);
    
}
- (void)presentVC {
    TestOneViewController * vc = [[TestOneViewController alloc] init];
    vc.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:vc animated:YES completion:nil];
}

//- (void)tapTable:(UIGestureRecognizer *)gesture
//    {
//        NSLog(@"手势触碰");
//    }
- (void)tapTable
{
    NSLog(@"手势触碰");
}
//- (void)subClick{
//    NSLog(@"当前类的子类实例方法接收到");
//}

- (void)printAddress{
    TestBaseViewController * vc = [[TestBaseViewController alloc] init];
    NSLog(@"TestBaseViewController = \n %@",vc.view);
    NSLog(@"subView = \n %@",self.view);
    NSLog(@"subView.superView = \n %@",self.view.superview);

}
// 获取timer定时器
- (NSTimer *)getTimerWithSel:(SEL)selector{
//    [TKSDWeakProxy proxyWithTarget:self]
    NSTimer * timer = [NSTimer scheduledTimerWithTimeInterval:1
                                                         target:self
                                                       selector:selector
                                                       userInfo:nil
                                                        repeats:YES];
    [timer setFireDate:[NSDate date]];
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
    return timer;
}

// 调用父类或者类别
- (void)superOfCate{
    
//      [self updateMvVideoForPeerID:@"小丑"];
//      [self showBeauty:YES];
       
}

- (UILabel *)subLabel{
    if (!_subLabel) {
        _subLabel = [[UILabel alloc] initWithFrame:CGRectMake(50, 50, 200, 30)];
        _subLabel.text = @"子类lablel";
        _subLabel.textColor = [UIColor blackColor];
        _subLabel.backgroundColor = [UIColor redColor];
        [self.view addSubview:_subLabel];
    }
    return _subLabel;
}
- (UILabel *)subLabel1{
    if (!_subLabel1) {
        _subLabel1 = [[UILabel alloc] initWithFrame:CGRectMake(50, 100, 200, 30)];
        _subLabel1.text = @"子类lablel1";
        _subLabel1.textColor = [UIColor blackColor];
        _subLabel1.backgroundColor = [UIColor redColor];
        [self.view addSubview:_subLabel1];
    }
    return _subLabel;
}
- (UILabel *)subLabel2{
    if (!_subLabel2) {
        _subLabel2 = [[UILabel alloc] initWithFrame:CGRectMake(50, 150, 200, 30)];
        _subLabel2.text = @"子类lablel2";
        _subLabel2.textColor = [UIColor blackColor];
        _subLabel2.backgroundColor = [UIColor redColor];
        [self.view addSubview:_subLabel2];
    }
    return _subLabel;
}

- (void)btnClick{
    self.presenter = [[Presenter alloc] init];
    [self.presenter attach:self];
//    [self.presenter changeIsHave:self.outsideBtn];

//    [self.presenter fetchData];
    
    [self.presenter getOutsideAddView:self.view btn:^(UIButton * _Nonnull btn1,UILabel * label) {
        self->_outsideBtn = btn1;
        self->_tipLabel = label;
    }];
    [self.outsideBtn setTitle:@"随便改的" forState:UIControlStateNormal];
    self.outsideBtn.backgroundColor = [UIColor cyanColor];
    [self.outsideBtn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
}

// 内存知识相关调用
- (void)memoryIsa {
//        GDPerson * person = [[GDPerson alloc] init];
    /*
     person
      isa GDPerson Class
      _name
     **/
//        [person print];
    //
    //    NSString * test = @"123";
        id cls = [GDPerson class];
        void * obj = &cls;
    //     给obj发一条print的消息,就会去通过obj的isa找到obj的类对象,去找方法列表
        [(__bridge id)obj print];
        
    //     堆栈排列的知识点
    /*
     1.栈内存空间 高地址到低地址
     2.堆内存空间 是由低地址向高地址扩展的
     
     2021-04-12 09:57:30.114832+0800 Test[95405:3642244] my name is <ViewController: 0x7fe406c098a0>
     (lldb) p/x obj  按照16进制格式显示变量
     (GDPerson *) $3 = 0x00007ffee2d33118
     (lldb) x/4g 0x00007ffee2d33118 x内存的缩写
     0x7ffee2d33118: 0x000000010cf134b8 0x00007fe406c098a0
     0x7ffee2d33128: 0x000000010cf132b0 0x00007fff61046145
     (lldb) p (Class) 0x000000010cf134b8
     (Class) $4 = GDPerson
     (lldb) po 0x000000010cf132b0
     ViewController

     **/
        
}

- (void)MVP{
    
}

-(void)removeOutsideBtn{
    [_outsideBtn removeFromSuperview];
    _outsideBtn = nil;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
//    [self.presenter closeAutoScreen:self];
}
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
}
- (UIButton *)serverBtn{
    if (!_serverBtn) {
        _serverBtn = [self.presenter serverBtWithTarget:self AddAction:@"serverAction:"];
        _serverBtn.frame = CGRectMake(100, 200, 200, 40);
        _serverBtn.backgroundColor = [UIColor cyanColor];
    }
    return  _serverBtn;
}
- (void)serverAction:(UIButton*)button{
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    self.presenter.name = @"Test";
    
//    NSLog(@"VC中 == %ld",_share.testCount);
//    [_share caculate];
//    NSLog(@"VC中 == 计算过后%ld %@",TK_Share.testCount,TK_Share);

  
//    self.tipLabel.text = @"改";
//    [self.presenter changeBtnFrame:self.outsideBtn];
//    TestOneViewController * oneVC = [[TestOneViewController alloc] init];

//    UINavigationController * navOneVC = [[UINavigationController alloc] initWithRootViewController:oneVC];
//    oneVC.modalPresentationStyle = UIModalPresentationFullScreen;
//    [self presentViewController:oneVC animated:YES completion:nil];
//    [self.navigationController pushViewController:navOneVC animated:YES];
    
//    [self.presenter handleBtn:self.outsideBtn];
//    NSLog(@"self.tView == %@",self.tView);
//    [self.tView changeFramerelyView:self.view];
//
//    NSLog(@"self.tView 的隐藏属性 == %@",NSStringFromCGRect(self.tView.bounds));
    
    NSLog(@"%s",__func__);
    
}
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    if ([keyPath isEqualToString:@"name"]) {
        NSLog(@"keypath====%@",keyPath);
        NSLog(@"change=====%@",change);

    }
}

- (void)test
{
    NSLog(@"3");
}

- (void)setupViews{
    _tView =  [[TestView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    _tView.backgroundColor = [UIColor redColor];
    NSLog(@"setupViews 执行");
    _tView.nameLabel.numberOfLines = 0;
    _tView.canTurnPage = YES;
    [self.view addSubview:_tView];
//       make.edges.equalTo(self.view.window).insets(UIEdgeInsetsMake( 0, 0, 0, 0));
//    [self.tView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(self.view.mas_left).offset(5);
//        make.right.equalTo(self.view.mas_right).offset(-5);
//        make.top.equalTo(self.view.mas_top).offset(5);
//        make.bottom.equalTo(self.view.mas_bottom).offset(-5);
//        make.edges.equalTo(self.view).insets(UIEdgeInsetsMake(5, 5, 5, 5));
//        make.center.equalTo(self.view);
//        make.width.equalTo(@(self.view.bounds.size.width/3));
//        make.height.equalTo(@(self.view.bounds.size.height/3));
//    }];
    
    
}


- (void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    NSLog(@"viewWillLayoutSubviews 执行");
}

- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    NSLog(@"viewDidLayoutSubviews 执行");
      
    /*
     po [self.view recursiveDescription]
     更改前 <UIView: 0x7fe5c640e040; frame = (0 0; 320 568); autoresize = W+H; layer = <CALayer: 0x600002d8b340>>
     | <TestView: 0x7fe5c640be40; frame = (0 0; 200 100); layer = <CALayer: 0x600002d8b1e0>>
     |    | <UILabel: 0x7fe5c640e5b0; frame = (0 0; 200 100); text = '测试案例'; userInteractionEnabled = NO; layer = <_UILabelLayer: 0x600000e8c0a0>>
     更改后
     <UIView: 0x7fe5c640e040; frame = (0 0; 320 568); autoresize = W+H; layer = <CALayer: 0x600002d8b340>>
        | <TestView: 0x7fe5c640be40; frame = (75 25; 50 50); layer = <CALayer: 0x600002d8b1e0>>
        |    | <UILabel: 0x7fe5c640e5b0; frame = (0 0; 200 100); text = '测试案例'; userInteractionEnabled = NO; layer = <_UILabelLayer: 0x600000e8c0a0>>
     **/
    
}

- (void)setNameText:(NSString *)nameText{
    self.tView.nameLabel.text = nameText;
    
}
- (void)delayLeveRoom{
   

//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self performSelector:@selector(leaveRoom) withObject:self afterDelay:3.0];

//    });
 
    
//    _timer = [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(timerAction) userInfo:nil repeats:YES];
//    [[NSRunLoop mainRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
}

- (void)timerAction{
    [self timerDealloc];
    [self leaveRoom];
  
}
//- (void)subClick{
//    NSLog(@"子类接收父类方法");
//}

- (void)leaveRoom{
    NSLog(@"离开教室 = %@",[NSThread currentThread]);
}

- (void)timerDealloc{
    [_timer invalidate];
    _timer = nil;
}
- (UIView *)userlistView{
    if (!_userlistView) {
        
        _userlistView = [[UIView alloc] initWithFrame:CGRectMake(0, 80, 200, 200)];
        _userlistView.backgroundColor = [UIColor cyanColor];
    }
    return  _userlistView;
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell1"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell1"];
    }
    NSString * str = self.dataArray[indexPath.row];
    cell.textLabel.text = str;
    return  cell;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return  self.dataArray.count;
}

@end
