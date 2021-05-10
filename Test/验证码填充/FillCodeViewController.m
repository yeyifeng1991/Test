//
//  FillCodeViewController.m
//  Test
//  验证码填充
//  Created by 叶义峰 on 2021/5/7.
//

#import "FillCodeViewController.h"

#import "ZZRTextView.h"
#import "KLCodeResignView.h"


#define WIDTH [UIScreen mainScreen].bounds.size.width
#define HEIGHT [UIScreen mainScreen].bounds.size.height


@interface FillCodeViewController ()<ZZRTextViewDelegate>
@property (nonatomic ,strong) UIButton * submitBtn;

@end

@implementation FillCodeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self bottomLineText];
    
}

- (void)roundText {
    
    ZZRTextView *textView = [[ZZRTextView alloc] initWithFrame:CGRectMake(100, 100, WIDTH-20, 50) CodeSize:CGSizeMake(50, 50) MaxCount:6];
    
    [textView setUpBorderWithNormalBorderColor:[UIColor lightGrayColor]
                          HighlightBorderColor:[UIColor darkGrayColor]
                                   BorderWidth:1.0
                            BorderCornerRadius:5.0];
    
    [textView setUpTextWithNormalTextColor:[UIColor blackColor]
                        HighlightTextColor:[UIColor blackColor]
                                  TextFont:[UIFont systemFontOfSize:20]
                             TextAlignment:NSTextAlignmentCenter
                              KeyboardType:UIKeyboardTypeNumberPad];
    
    
    textView.delegate = self;
    textView.textFinished = ^(NSString *codeStr){
        
        NSLog(@"block out -- %@",codeStr);
    };
    
    
    [self.view addSubview:textView];
}

- (void)bottomLineText {
    tk_weakify(self);
        KLCodeResignView *codeView = [[KLCodeResignView alloc] initWithCodeBits:4];
        codeView.codeResignCompleted = ^(NSString * _Nonnull content) {
            //对应位数输入完成时 允许提交按钮有效 允许提交
            NSLog(@"%@", content);
            weakSelf.submitBtn.enabled = YES;
            weakSelf.submitBtn.alpha = 1.0f;
        };
        codeView.codeResignUnCompleted = ^(NSString * _Nonnull content) {
            //对应位数未输入完成时 提交按钮失效 不允许提交
            weakSelf.submitBtn.enabled = NO;
            weakSelf.submitBtn.alpha = 0.5f;
        };
        [self.view addSubview:codeView];
        
        [codeView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(weakSelf.view).mas_offset(15.0f);
            make.right.mas_equalTo(weakSelf.view).mas_offset(-15.0f);
            make.top.mas_equalTo(weakSelf.view).mas_offset(150.0f);
            make.height.mas_equalTo(40.0f);
        }];
        
        _submitBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _submitBtn.titleLabel.font = [UIFont systemFontOfSize:17];
        [_submitBtn setTitle:@"提交" forState:UIControlStateNormal];
        [_submitBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_submitBtn setBackgroundColor:[UIColor cyanColor]];
        _submitBtn.enabled = NO;
        _submitBtn.alpha = 0.5f;
        _submitBtn.layer.cornerRadius = 5.0f;
    //    [submitBtn addTarget:self action:@selector(submitBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_submitBtn];
        [_submitBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(weakSelf.view).mas_offset(20.0f);
            make.right.mas_equalTo(weakSelf.view).mas_offset(-20.0f);
            make.top.mas_equalTo(weakSelf.view).mas_offset(260.0f);
            make.height.mas_equalTo(45.0f);
        }];
}

- (void)ZZRTextViewDidFinishedEdit:(NSString *)codeStr
{
    NSLog(@"delegate out -- %@",codeStr);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
