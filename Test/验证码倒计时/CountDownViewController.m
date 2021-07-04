//
//  CountDownViewController.m
//  Test
//
//  Created by 叶义峰 on 2021/5/11.
// 倒计时界面

#import "CountDownViewController.h"

@interface CountDownViewController ()
{
    // 创建一个定时器
    NSTimer *timer;
}
// 计时索引
@property (nonatomic, assign) NSInteger indexTime;

@property (weak, nonatomic) IBOutlet UIButton *codeBtn;


@end

@implementation CountDownViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    if ([TestManager sharedInstance].isSending) {
        NSLog(@"发送过程中 不再触发发送接口");
        self.indexTime = [TestManager sharedInstance].indexTime;
        [self.codeBtn setTitle:[NSString stringWithFormat:@"%ld", (long)self.indexTime] forState:UIControlStateNormal];

    }else{
         self.indexTime = 60;
    }
    tk_weakify(self);
    timer = [NSTimer timerWithTimeInterval:1.0 target:weakSelf selector:@selector(checkTimeAutoAdd) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
}


// 获取验证码定时操作
- (void)checkTimeAutoAdd
{
    self.indexTime--;
    if (self.indexTime <= 60 && self.indexTime > 0) {
        [self.codeBtn setTitle:[NSString stringWithFormat:@"%ld", (long)self.indexTime] forState:UIControlStateNormal];
    }else
    {
        [timer invalidate];
        timer = nil;
        [self.codeBtn setTitle:@"重新获取" forState:UIControlStateNormal];
    }
}


- (void)dealloc {
//    [timer invalidate];
//    timer = nil;
    NSLog(@"dealloc");

}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
        [timer invalidate];
        timer = nil;
    if (self.indexTime <= 60 && self.indexTime > 0) {
        [TestManager sharedInstance].isSending = YES;
        [TestManager sharedInstance].indexTime = self.indexTime; // 存储时间
    }
    
    
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
