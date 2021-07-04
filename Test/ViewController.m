//
//  ViewController.m
//  Test
//
//  Created by 叶义峰 on 2021/3/27.
//

#import "ViewController.h"
#import "TestBaseViewController+Beauty.h"
#import "TKSDWeakProxy.h"
#import "FMAudioMicViewController.h" // 音视频录制
#import "FillCodeViewController.h"
#import "PhotoSelectViewController.h" // 图像选择
#import "PieChartViewController.h" // 饼状图
#import "TestDownLoadViewController.h"
#import "RunLoopViewController.h"
#import "MyThread.h"
#import "ScanViewController.h" // 文档查阅
#import "TelephoneCodeViewController.h" // 获取国际区号
#import "CountDownViewController.h" // 倒计时界面
#import "StoreDataViewController.h"
#import "UIButton+ImageAlignmentStyle.h"
#import "LoadingBtnViewController.h" // 加载动画
#import "TimerViewController.h" // 倒计时
#import "AniViewController.h"
#import "AudioVideoViewController.h" // 音视频录制播放
#import "wechatViewController.h" // 图文混排
#import "TestOneViewController.h"

#import "TestView.h"
#import "PersonProtocol.h"
#import "Presenter.h"
#import "Masonry.h"
#import "TestShared.h" //  单例使用
#import "GDPerson.h" // 内存考察
#import "testMarco.h"
#import "CustomHeightViewController.h"



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


@interface ViewController ()<PersonProtocol,UITableViewDataSource,UITableViewDelegate>

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

//    [self initTableView];
    
   
    
    [self addAudioBtn];
//    self.dataArray = [NSMutableArray array];
//    for (int i = 0; i< 10; i++) {
//        [self.dataArray addObject:[NSString stringWithFormat:@"%d",i]];
//
//    }
//    [self.tableView reloadData];
   

//    [self memoryIsa]; // 内存相关
    
//     po [self.view recursiveDescription]
}
- (void)font {
    UIFont *font1 = [UIFont systemFontOfSize:16];
    UIFont *font2 = [UIFont boldSystemFontOfSize:16];
    UIFont *font3 = [UIFont italicSystemFontOfSize:16];

    UIFont *font4 = [UIFont systemFontOfSize:16 weight:UIFontWeightRegular];
    UIFont *font5 = [UIFont systemFontOfSize:16 weight:UIFontWeightMedium];
    UIFont *font6 = [UIFont systemFontOfSize:16 weight:UIFontWeightSemibold];

//打印：
//<UICTFont: 0x10a91cbe0> font-family: ".SFUI-Regular"; font-weight: normal; font-style: normal; font-size: 16.00pt
//<UICTFont: 0x10a930de0> font-family: ".SFUI-Semibold"; font-weight: bold; font-style: normal; font-size: 16.00pt
//<UICTFont: 0x10a92f650> font-family: ".SFUI-RegularItalic"; font-weight: normal; font-style: italic; font-size: 16.00pt
//
//<UICTFont: 0x105a01f80> font-family: ".SFUI-Regular"; font-weight: normal; font-style: normal; font-size: 16.00pt
//<UICTFont: 0x105943960> font-family: ".SFUI-Medium"; font-weight: normal; font-style: normal; font-size: 16.00pt
//<UICTFont: 0x1059443c0> font-family: ".SFUI-Semibold"; font-weight: bold; font-st

}

- (void)testDemo {
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

//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
//{
//    self.presenter.name = @"Test";
//
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
    
//    NSLog(@"%s",__func__);
//
//}
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    if ([keyPath isEqualToString:@"name"]) {
        NSLog(@"keypath====%@",keyPath);
        NSLog(@"change=====%@",change);

    }
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
//
//- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
//    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell1"];
//    if (cell == nil) {
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell1"];
//    }
//    NSString * str = self.dataArray[indexPath.row];
//    cell.textLabel.text = str;
//    return  cell;
//}
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
//{
//    return  self.dataArray.count;
//}

#pragma mark - 音视频录制播放
- (void)addAudioBtn {
    UIButton *Btn = [UIButton buttonWithType:UIButtonTypeCustom];
    Btn.frame = CGRectMake(100,100, 100, 30);
    Btn.backgroundColor = [UIColor redColor];
    [Btn setTitle:@"录音跳转" forState:0];
    [Btn setTitleColor:[UIColor whiteColor] forState:0];
    [self.view addSubview:Btn];
    [Btn addTarget:self action:@selector(BtnAction) forControlEvents:UIControlEventTouchUpInside];
    
    
    UIButton *Btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    Btn1.frame = CGRectMake(100, 150, 100, 30);
    Btn1.backgroundColor = [UIColor redColor];
    [Btn1 setTitle:@"验证码" forState:0];
    [Btn1 setTitleColor:[UIColor whiteColor] forState:0];
    [self.view addSubview:Btn1];
    [Btn1 addTarget:self action:@selector(smsClick) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *Btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    Btn2.frame = CGRectMake(100, 200, 100, 30);
    Btn2.backgroundColor = [UIColor redColor];
    [Btn2 setTitle:@"图像选择" forState:0];
    [Btn2 setTitleColor:[UIColor whiteColor] forState:0];
    [self.view addSubview:Btn2];
    [Btn2 addTarget:self action:@selector(photoSelectClick) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *Btn3 = [UIButton buttonWithType:UIButtonTypeCustom];
    Btn3.frame = CGRectMake(100, 250, 100, 30);
    Btn3.backgroundColor = [UIColor redColor];
    [Btn3 setTitle:@"饼状图" forState:0];
    [Btn3 setTitleColor:[UIColor whiteColor] forState:0];
    [self.view addSubview:Btn3];
    [Btn3 addTarget:self action:@selector(pieVCClick) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *Btn4 = [UIButton buttonWithType:UIButtonTypeCustom];
    Btn4.frame = CGRectMake(100, 250, 100, 30);
    Btn4.backgroundColor = [UIColor redColor];
    [Btn4 setTitle:@"断点下载" forState:0];
    [Btn4 setTitleColor:[UIColor whiteColor] forState:0];
    [self.view addSubview:Btn4];
    [Btn4 addTarget:self action:@selector(downLoadResumeClick) forControlEvents:UIControlEventTouchUpInside];
    
    
    UIButton *Btn5 = [UIButton buttonWithType:UIButtonTypeCustom];
    Btn5.frame = CGRectMake(100, 300, 100, 30);
    Btn5.backgroundColor = [UIColor redColor];
    [Btn5 setTitle:@"文档查阅" forState:0];
    [Btn5 setTitleColor:[UIColor whiteColor] forState:0];
    [self.view addSubview:Btn5];
    [Btn5 addTarget:self action:@selector(ScanClick) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *Btn6 = [UIButton buttonWithType:UIButtonTypeCustom];
    Btn6.frame = CGRectMake(100, 350, 100, 30);
    Btn6.backgroundColor = [UIColor redColor];
    [Btn6 setTitle:@"国际区号" forState:0];
    [Btn6 setTitleColor:[UIColor whiteColor] forState:0];
    [self.view addSubview:Btn6];
    [Btn6 addTarget:self action:@selector(countryCodeClick) forControlEvents:UIControlEventTouchUpInside];
    
    
    UIButton *Btn7 = [UIButton buttonWithType:UIButtonTypeCustom];
    Btn7.frame = CGRectMake(100, 400, 100, 30);
    Btn7.backgroundColor = [UIColor redColor];
    [Btn7 setTitle:@"信息存储" forState:0];
    [Btn7 setTitleColor:[UIColor whiteColor] forState:0];
    [self.view addSubview:Btn7];
    [Btn7 addTarget:self action:@selector(storeClick) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *Btn8 = [UIButton buttonWithType:UIButtonTypeCustom];
    Btn8.frame = CGRectMake(100, 450, 100, 30);
    Btn8.backgroundColor = [UIColor redColor];
    [Btn8 setTitle:@"倒计时" forState:0];
    [Btn8 setTitleColor:[UIColor whiteColor] forState:0];
    [self.view addSubview:Btn8];
    [Btn8 addTarget:self action:@selector(countDownClick) forControlEvents:UIControlEventTouchUpInside];
    
    
    UIButton *Btn9 = [UIButton buttonWithType:UIButtonTypeCustom];
    Btn9.frame = CGRectMake(100, 500, 100, 30);
    Btn9.backgroundColor = [UIColor redColor];
    [Btn9 setTitle:@"加载动画" forState:0];
    [Btn9 setTitleColor:[UIColor whiteColor] forState:0];
    [self.view addSubview:Btn9];
    [Btn9 addTarget:self action:@selector(loadingBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *Btn10 = [UIButton buttonWithType:UIButtonTypeCustom];
    Btn10.frame = CGRectMake(100, 550, 100, 30);
    Btn10.backgroundColor = [UIColor redColor];
    [Btn10 setTitle:@"动画" forState:0];
    [Btn10 setTitleColor:[UIColor whiteColor] forState:0];
    [self.view addSubview:Btn10];
    [Btn10 addTarget:self action:@selector(aniBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *Btn11 = [UIButton buttonWithType:UIButtonTypeCustom];
    Btn11.frame = CGRectMake(100, 600, 200, 30);
    Btn11.backgroundColor = [UIColor redColor];
    [Btn11 setTitle:@"音视频录制播放" forState:0];
    [Btn11 setTitleColor:[UIColor whiteColor] forState:0];
    [self.view addSubview:Btn11];
    [Btn11 addTarget:self action:@selector(avClick) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *Btn12 = [UIButton buttonWithType:UIButtonTypeCustom];
    Btn12.frame = CGRectMake(100, 640, 100, 30);
    Btn12.backgroundColor = [UIColor redColor];
    [Btn12 setTitle:@"图文混排" forState:0];
    [Btn12 setTitleColor:[UIColor whiteColor] forState:0];
    [self.view addSubview:Btn12];
    [Btn12 addTarget:self action:@selector(wechatClick) forControlEvents:UIControlEventTouchUpInside];
}
- (void)BtnAction{
    
//    FMAudioMicViewController *vc = [[FMAudioMicViewController alloc]init];
////    [self presentViewController:vc animated:YES completion:nil];
//
//    [self.navigationController pushViewController:vc animated:YES];
    
    CustomHeightViewController *vc = [[CustomHeightViewController alloc]init];
 ////    [self presentViewController:vc animated:YES completion:nil];
 //
     [self.navigationController pushViewController:vc animated:YES];
    
    
}

- (void)smsClick{
    NSLog(@"点击了跳转");
    
    FillCodeViewController *vc = [[FillCodeViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
    
}

- (void)photoSelectClick{
    PhotoSelectViewController *vc = [[PhotoSelectViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
    
}

- (void)pieVCClick {
    PieChartViewController * pieVC = [PieChartViewController new];
    [self.navigationController pushViewController:pieVC animated:YES];
}

- (void)downLoadResumeClick {
    TestDownLoadViewController * pieVC = [TestDownLoadViewController new];
    [self.navigationController pushViewController:pieVC animated:YES];
}
- (void)ScanClick {
    ScanViewController * pieVC = [ScanViewController new];
    [self.navigationController pushViewController:pieVC animated:YES];
}


- (void)countryCodeClick {
    TelephoneCodeViewController * pieVC = [TelephoneCodeViewController new];
    [self.navigationController pushViewController:pieVC animated:YES];
}

- (void)storeClick {
    StoreDataViewController * storeVC = [[StoreDataViewController alloc] init];
    [self.navigationController pushViewController:storeVC animated:YES];

}

- (void)countDownClick {
//    CountDownViewController * countDownVC = [[CountDownViewController alloc] init];
//    [self.navigationController pushViewController:countDownVC animated:YES];
    
    
    TimerViewController * timerVC =  [TimerViewController sharedInstance];
    NSLog(@"B界面地址 push前 %p",timerVC);
    [self.navigationController pushViewController:timerVC animated:YES];

}

- (void)loadingBtnClick {
    LoadingBtnViewController * loadingVC = [[LoadingBtnViewController alloc] init];
    [self.navigationController pushViewController:loadingVC animated:YES];
}

- (void)aniBtnClick{
    [self.navigationController pushViewController:[AniViewController new] animated:YES];
}
- (void)avClick{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"av" bundle:[NSBundle mainBundle]];
    AudioVideoViewController *loginViewController = [storyboard instantiateViewControllerWithIdentifier:@"avVC"];
    [self.navigationController pushViewController:loginViewController animated:YES];
//    [self.navigationController pushViewController:[AudioVideoViewController new] animated:YES];
}
- (void)wechatClick{
    [self.navigationController pushViewController:[wechatViewController new] animated:YES];
}

// table view

- (void)initTableView
{
    
    UITableView *lessonTableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    lessonTableView.dataSource = self;
    lessonTableView.delegate = self;
//    lessonTableView.separatorColor = [UIColor clearColor];
//    lessonTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:lessonTableView];
  
    
}

#pragma mark - Notification


#pragma mark - Delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
   if(section == 0)
   {
       return 2;
   }else if (section == 1)
   {
       return 3;
   }else{
       return 1;
   }
    
  
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *lessonCell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!lessonCell) {
        lessonCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
    }
    lessonCell.detailTextLabel.text = @"detali中国";
    lessonCell.textLabel.text = @"text中国";
    return lessonCell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0 ) {
        return 55;
    }
    return 50;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
//    if (indexPath.section != 2) {
        // 圆角角度
        CGFloat radius = 10.f;
        // 设置cell 背景色为透明
        cell.backgroundColor = UIColor.clearColor;
        // 创建两个layer
        CAShapeLayer *normalLayer = [[CAShapeLayer alloc] init];
        CAShapeLayer *selectLayer = [[CAShapeLayer alloc] init];
        // 获取显示区域大小
        CGRect bounds = CGRectInset(cell.bounds, 20, 0);
        // cell的backgroundView
        UIView *normalBgView = [[UIView alloc] initWithFrame:bounds];
        // 获取每组行数
        NSInteger rowNum = [tableView numberOfRowsInSection:indexPath.section];
        // 贝塞尔曲线
        UIBezierPath *bezierPath = nil;
        
        if (rowNum == 1) {
            // 一组只有一行（四个角全部为圆角）
            bezierPath = [UIBezierPath bezierPathWithRoundedRect:bounds byRoundingCorners:UIRectCornerAllCorners cornerRadii:CGSizeMake(radius, radius)];
            normalBgView.clipsToBounds = NO;
        }else {
            normalBgView.clipsToBounds = YES;
            if (indexPath.row == 0) {
                normalBgView.frame = UIEdgeInsetsInsetRect(bounds, UIEdgeInsetsMake(-5, 0, 0, 0));
                CGRect rect = UIEdgeInsetsInsetRect(bounds, UIEdgeInsetsMake(5, 0, 0, 0));
                // 每组第一行（添加左上和右上的圆角）
                bezierPath = [UIBezierPath bezierPathWithRoundedRect:rect byRoundingCorners:(UIRectCornerTopLeft|UIRectCornerTopRight) cornerRadii:CGSizeMake(radius, radius)];
            }else if (indexPath.row == rowNum - 1) {
                normalBgView.frame = UIEdgeInsetsInsetRect(bounds, UIEdgeInsetsMake(0, 0, -5, 0));
                CGRect rect = UIEdgeInsetsInsetRect(bounds, UIEdgeInsetsMake(0, 0, 5, 0));
                // 每组最后一行（添加左下和右下的圆角）
                bezierPath = [UIBezierPath bezierPathWithRoundedRect:rect byRoundingCorners:(UIRectCornerBottomLeft|UIRectCornerBottomRight) cornerRadii:CGSizeMake(radius, radius)];
            }else {
                // 每组不是首位的行不设置圆角
                bezierPath = [UIBezierPath bezierPathWithRect:bounds];
            }
        }
        
        // 阴影
        if (indexPath.section != 2) {
            normalLayer.shadowColor = [UIColor blackColor].CGColor;
            normalLayer.shadowOpacity = 0.2;
            normalLayer.shadowOffset = CGSizeMake(0, 0);
            normalLayer.path = bezierPath.CGPath;
            normalLayer.shadowPath = bezierPath.CGPath;
        }

        
        // 把已经绘制好的贝塞尔曲线路径赋值给图层，然后图层根据path进行图像渲染render
        normalLayer.path = bezierPath.CGPath;
        selectLayer.path = bezierPath.CGPath;
        
        // 设置填充颜色
        normalLayer.fillColor = [UIColor whiteColor].CGColor;
        // 添加图层到nomarBgView中
        [normalBgView.layer insertSublayer:normalLayer atIndex:0];
        normalBgView.backgroundColor = UIColor.clearColor;
        cell.backgroundView = normalBgView;
        
        // 替换cell点击效果
        UIView *selectBgView = [[UIView alloc] initWithFrame:bounds];
        selectLayer.fillColor = [UIColor colorWithWhite:0.95 alpha:1.0].CGColor;
        [selectBgView.layer insertSublayer:selectLayer atIndex:0];
        selectBgView.backgroundColor = UIColor.clearColor;
        cell.selectedBackgroundView = selectBgView;
//    }

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




@end
