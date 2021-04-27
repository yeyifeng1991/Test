//
//  TestSuperBaseViewController.m
//  Test
//
//  Created by 叶义峰 on 2021/4/14.
//

#import "TestSuperBaseViewController.h"

@interface TestSuperBaseViewController ()

@end

@implementation TestSuperBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)subClick{
    NSLog(@"当前父类的方法接收到");
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
