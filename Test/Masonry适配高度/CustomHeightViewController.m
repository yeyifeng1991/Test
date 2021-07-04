//
//  CustomHeightViewController.m
//  Test
//
//  Created by 叶义峰 on 2021/6/30.
//

#import "CustomHeightViewController.h"
#import "CustomView.h"


@interface CustomHeightViewController ()

@end

@implementation CustomHeightViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIScrollView * scrollView = [[UIScrollView alloc] init];
    scrollView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:scrollView];
    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
          make.left.right.equalTo(@0);
          make.top.equalTo(@(100));
          make.bottom.equalTo(@0);
      }];
    
    
    
    UIView * view1 = UIView.new;
    view1.backgroundColor = [UIColor purpleColor];
    [scrollView addSubview:view1];
    [view1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_offset(10);
        make.left.right.equalTo(@0);
        make.height.equalTo(@30);
        
    }];
    
    CustomView * view = CustomView.new;
    view.backgroundColor = [UIColor greenColor];
    [scrollView addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(view1.mas_bottom).offset(10);

        make.left.right.equalTo(@(0));
    }];
    
    
    UIButton * submitBtn = [[UIButton alloc]init];
    [submitBtn setTitle: TKMTLocalized(@"Guid.Done") forState:UIControlStateNormal];
    [scrollView addSubview:submitBtn];
    [submitBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(view.mas_bottom).offset(10);
        make.centerX.equalTo(@0);
        make.height.equalTo(@54);
        make.left.equalTo(@10);
    }];
    
    
    
    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(submitBtn.mas_bottom).offset(40);
    }];
    // Do any additional setup after loading the view from its nib.
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
