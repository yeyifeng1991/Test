//
//  TimerViewController.m
//  Test
//
//  Created by 叶义峰 on 2021/5/30.
//

#import "TimerViewController.h"

@interface TimerViewController ()
{
    dispatch_source_t _timer;
}
@property (weak, nonatomic) IBOutlet UIButton *timerBtn;
@property (nonatomic,strong) CADisplayLink  * displayLink ;
@property (nonatomic,assign)   NSInteger indexTime;
// 计时时间
@property (nonatomic, assign) int timeout;


@end

@implementation TimerViewController
static TimerViewController * single = nil;
static dispatch_once_t onceToken;
+(instancetype)sharedInstance
 {
   return [[self alloc]init];// 这里会调用init方法
 }
// init方法，重写init方法
 -(instancetype)init
 {
    if (self = [super init]) {
 }
    return self;
 }
//使用alloc方法初始化一个类的实例的时候，默认是调用了allocWithZone的方法。为了保持单例类实例的唯一性，需要覆盖所有会生成新的实例的方法，如果初始化这个单例类的时候不走[[Class alloc] init]

// 把创建单例的写法写在系统为对象分配内存地址的方法中
 +(instancetype)allocWithZone:(struct _NSZone *)zone
 {
     dispatch_once(&onceToken, ^{
    // 记住这里只会执行一次
     single = [super allocWithZone:zone];// 最先执行，只执行一次
     });
     return single;
 }

- (void)viewDidLoad {
    [super viewDidLoad];
    self.indexTime = 60;
    NSLog(@"B界面地址 push后 %p",self);

    // Do any additional setup after loading the view from its nib.
}
- (IBAction)timerClick:(id)sender {
}

- (IBAction)displayLinkClick:(id)sender {
    self.displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(handleDisplayLink:)];
    self.displayLink.preferredFramesPerSecond = 1;
    [self.displayLink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
    NSLog(@"定时器开启");

}

- (IBAction)gcdClick:(id)sender {
    if (_timeout > 0) {
        return;
    }
    self.timeout = 60;
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    dispatch_source_set_timer(_timer, dispatch_walltime(NULL, 0), 1.0 * NSEC_PER_SEC, 0);// 每秒执行
    __weak typeof(self) weakself = self;
    dispatch_source_set_event_handler(_timer, ^{
        if (weakself.timeout <= 0) // 倒计时结束
        {
            dispatch_source_cancel(self->_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的按钮显示 根据自己需求设置
                               [self.timerBtn setTitle:@"发送" forState:UIControlStateNormal];
//
                               self.timerBtn.enabled = YES;
                
            });
        }else{ // 倒计时中
            // 显示倒计时结果
                      
            NSString *strTime = [NSString stringWithFormat:@"重发(%.2d)", self->_timeout];
                      
                      dispatch_async(dispatch_get_main_queue(), ^{
                          
                          //设置界面的按钮显示 根据自己需求设置
                          
                          [self.timerBtn setTitle:[NSString stringWithFormat:@"%@",strTime] forState:UIControlStateNormal];
                          
                          self.timerBtn.enabled = NO;
                          
                      });
                      
            self->_timeout--;
            
        }
    });
    dispatch_resume(_timer);
    
}

- (void)handleDisplayLink:(CADisplayLink*)link {
    if (self.indexTime <= 0){
        // 倒计时结束
        [self.displayLink invalidate];
         self.displayLink = nil;
        [[self class] attempDealloc];
    }
    self.indexTime -= 1;
    
    [self.timerBtn setTitle:[NSString stringWithFormat:@"%ld",self.indexTime] forState:UIControlStateNormal];
   
    
    
}

- (IBAction)invaliteClick:(id)sender {
    if (self.displayLink) {
        [self.displayLink invalidate];
        self.displayLink = nil;
    }
}

- (void)dealloc{
    NSLog(@"页面释放");

}

+(void)attempDealloc{
    onceToken = 0; // 只有置成0,GCD才会认为它从未执行过.它默认为0.这样才能保证下次再次调用shareInstance的时候,再次创建对象.
    single = nil;
 }

@end
