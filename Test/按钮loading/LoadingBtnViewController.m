//
//  ViewController.m
//  IANActivityIndicatorButton
//
//  Created by ian on 15/7/21.
//  Copyright (c) 2015年 ian. All rights reserved.
//

#import "LoadingBtnViewController.h"
#import "IANActivityIndicatorButton.h"
#import "UIButton+IANActivityView.h"
#import "UIControl+Limit.h"

@interface LoadingBtnViewController ()
{
    IANActivityIndicatorButton *_btn;
}
@end

@implementation LoadingBtnViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    _btn = [[IANActivityIndicatorButton alloc] init];
    _btn.frame = CGRectMake(15, 100, self.view.bounds.size.width - 30, 80);
    _btn.backgroundColor = [UIColor redColor];
    [_btn setTitle:@"这是一个神奇的button" forState:UIControlStateNormal];
    _btn.layer.cornerRadius = 10;
    [self.view addSubview:_btn];
    _btn.tag = 2423;
    __weak typeof(self) weakSelf = self;
    _btn.TouchBlock = ^(IANActivityIndicatorButton *myButton){
        __strong typeof(weakSelf) strongSelf = weakSelf;
        NSLog(@"测试:%d",myButton.tag);
        [myButton startButtonActivityIndicatorView];
        
        
        [strongSelf performSelector:@selector(after) withObject:strongSelf afterDelay:2];
    };
    

    
//     防止重复点击
    
    UIButton * testBtn = [[UIButton alloc]init];
    testBtn.frame = CGRectMake(15, 200, self.view.bounds.size.width - 30, 80);
    [testBtn setTitle: @"重复点击" forState:UIControlStateNormal];
    [testBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [testBtn addTarget:self action:@selector(clickCount) forControlEvents:UIControlEventTouchUpInside];
    testBtn.acceptEventInterval = 1;
    [self.view addSubview:testBtn];
  
   
}

- (void)after
{
    [_btn endButtonActivityIndicatorView];
}

- (void)clickCount{
    NSLog(@" === 重复按钮点击 === ");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
