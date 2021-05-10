//
//  RunLoopViewController.m
//  Test
//
//  Created by 叶义峰 on 2021/5/7.
//
/*
 Core Foundation中关于RunLoop的5个类

 1.CFRunLoopRef

 2.CFRunLoopModeRef 代表RunLoop的运行模式

 3.CFRunLoopSourceRef

 4.CFRunLoopTimerRef

 5.CFRunLoopObserverRef
 
 
 **/

#import "RunLoopViewController.h"
#import "MyThread.h"

@interface RunLoopViewController ()
@property (nonatomic, strong) MyThread * myThread;

@end

@implementation RunLoopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.myThread = [[MyThread alloc] initWithTarget:self selector:@selector(run) object:nil];
    [self.myThread start];
 
//    [self addAudioBtn];
//    self.dataArray = [NSMutableArray array];
//    for (int i = 0; i< 10; i++) {
//        [self.dataArray addObject:[NSString stringWithFormat:@"%d",i]];
//
//    }
//    [self.tableView reloadData];
   

//    [self memoryIsa]; // 内存相关
    
//     po [self.view recursiveDescription]
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self performSelector:@selector(test) onThread:self.myThread withObject:nil waitUntilDone:NO];
}
- (void)test {
    NSLog(@" %s",__func__);
}
- (void)run {
    NSLog(@"%s %@", __func__,[NSThread currentThread]);
//    如果Mode里面没有任何Source0/Source1/Timer/Observer,RunLoop会立马退出
//    port 就是source1的意思
    [[NSRunLoop currentRunLoop] addPort:[[NSPort alloc] init] forMode:NSDefaultRunLoopMode];
    [[NSRunLoop currentRunLoop] run];
    NSLog(@"------- end ------");
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
