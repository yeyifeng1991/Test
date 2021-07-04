//
//  KLCodeResignView.m
//  Test
//
//  Created by 叶义峰 on 2021/5/7.
//

#import "KLCodeResignView.h"
#import "WDTextField.h"

#define WEAKSELF typeof(self) __weak weakSelf = self;
//自定义 验证码展示视图 view，由一个label和一个下划线组成
@interface KLCodeView : UIView

@property (strong, nonatomic) NSString *text;
@property (strong, nonatomic) UILabel *codeLabel;
@property (strong, nonatomic) UIView *lineView;
@property (nonatomic,strong)  CAShapeLayer  * aniLine; // 动画line


@end


@interface KLCodeResignView () <UITextFieldDelegate,WDTextFieldDelegate>

@property (strong, nonatomic) WDTextField *contentF; //监听内容输入
@property (strong, nonatomic) NSArray<KLCodeView *> *codeViewsArr;//显示输入内容的codeView数组
@property (assign, nonatomic) NSInteger currIndex;//当前待输入的codeView的下标

@property (assign, nonatomic) NSInteger codeBits;//位数

@end

@implementation KLCodeResignView

- (instancetype)initWithCodeBits:(NSInteger)codeBits {
    self = [super init];
    self.backgroundColor = [UIColor whiteColor];
    self.codeBits = codeBits;
    if (self) {
        //验证码默认是4位
        if (self.codeBits < 1) {
            self.codeBits = 6;
        }
        WEAKSELF
        [self addSubview:self.contentF];
        [self.contentF mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.right.left.mas_equalTo(weakSelf).mas_offset(0.0f);
        }];
        
        for(NSInteger i = 0; i < self.codeBits; i++) {
            KLCodeView *codeView = self.codeViewsArr[i];
//            if (i == 0) {
//                codeView.aniLine.hidden = NO;
//                [codeView.aniLine addAnimation:[self opacityAnimation] forKey:@"kOpacityAnimation"];
//            }
            [self addSubview:codeView];
        }
       
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidShow)  name:UIKeyboardDidShowNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidHide)  name:UIKeyboardWillHideNotification object:nil];

    }
    return self;
}
- (CABasicAnimation *)opacityAnimation {
    CABasicAnimation *opacityAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    opacityAnimation.fromValue = @(1.0);
    opacityAnimation.toValue = @(0.0);
    opacityAnimation.duration = 0.9;
    opacityAnimation.repeatCount = HUGE_VALF;
    opacityAnimation.removedOnCompletion = YES;
    opacityAnimation.fillMode = kCAFillModeForwards;
    opacityAnimation.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    return opacityAnimation;
}

- (void)keyboardDidHide
{
    NSLog(@"键盘下落");
}
- (void)keyboardDidShow
{
    NSLog(@"键盘显示");
}

- (void)layoutSubviews {
    [super layoutSubviews];
    WEAKSELF
    //设定每个数字之间的间距为数字view宽度的一半 总宽度就是 bits + （bits - 1）* 0.5
    CGFloat codeViewWidth = self.bounds.size.width/(self.codeBits * 1.5 - 0.5);
    for(NSInteger i = 0; i < self.codeBits; i++) {
        KLCodeView *codeView = self.codeViewsArr[i];
        [codeView mas_updateConstraints:^(MASConstraintMaker *make) {
            CGFloat left = codeViewWidth * 1.5 * i;
            make.left.mas_equalTo(weakSelf).mas_offset(left);
            make.top.bottom.mas_equalTo(weakSelf).mas_offset(0.0f);
            make.width.mas_equalTo(codeViewWidth);
        }];
    }
}

#pragma mark --- UITextField delegate
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    //完成 则收回键盘
    if ([string isEqualToString:@"\n"]) {
        [textField resignFirstResponder];
        return NO;
    }
//    //删除 操作
    if ([string isEqualToString:@""]) {
//        if (self.currIndex == 0) {//待输入的下标为0时 删除时下标不变化，否则下标减1
//            self.codeViewsArr[self.currIndex].text = string;
//        } else {
//            self.codeViewsArr[--self.currIndex].text = string;
//            if (self.codeResignUnCompleted) {
//                NSString *content = [textField.text substringToIndex:self.currIndex];
//                self.codeResignUnCompleted(content);
//            }
//        }
        return YES;
    }
    //判断 输入的是否是纯数字，不是纯数字 输入无效
    if (![self judgePureInt:string]) {
        return NO;
    }
    //如果输入的内容超过了验证码的长度 则输入无效
    if ((textField.text.length + string.length) > self.codeBits) {
        return NO;
    }
    //输入的数字，则当前待输入的下标对应的 view中添加输入的数字，并且下标加1
//    TODO:- 重点
    self.codeViewsArr[self.currIndex++].text = string;
    //当当前待输入的下标为codebits时表示已经输入了对应位数的验证码，执行完成操作
    if (self.currIndex == self.codeBits && self.codeResignCompleted) {
        NSString *content = [NSString stringWithFormat:@"%@%@", textField.text, string];
        self.codeResignCompleted(content);
    } else {
        if (self.codeResignUnCompleted) {
            NSString *content = [NSString stringWithFormat:@"%@%@", textField.text, string];
            self.codeResignUnCompleted(content);
        }
    }
    
    return YES;
}
- (void)setCodeText:(NSString*)text;
{
    NSMutableArray * array = [self stringArray:text];
    
    if (text.length != 1) {
//  遍历赋值
        for (NSString  * str  in  array) {
            self.codeViewsArr[self.currIndex++].text = str;
        }
//
        if (text.length == self.codeBits && self.codeResignCompleted) // 自动填充密码 数 为 6位时
        {
    //        [textField resignFirstResponder];
            self.codeResignCompleted(text);
        }

    }
}

- (NSMutableArray*)stringArray:(NSString*)text {
    NSString *temp =nil;
    NSMutableArray * array = [NSMutableArray array];
      for(int i =0; i < [text length]; i++)
      {
          temp = [text substringWithRange:NSMakeRange(i,1)];
          [array addObject:temp];
      }
    return array;
}

- (UITextField *)contentF {
    if (!_contentF) {
        _contentF = [[WDTextField alloc] init];
        _contentF.wd_delegate = self;
        //背景颜色和字体颜色都设置为透明的，这样在界面上就看不到
        _contentF.backgroundColor = [UIColor clearColor];
        _contentF.textColor = [UIColor clearColor];
        _contentF.keyboardType = UIKeyboardTypeNumberPad;//数字键盘
        _contentF.returnKeyType = UIReturnKeyDone;//完成
        _contentF.tintColor = [UIColor clearColor];//设置光标的颜色
        _contentF.delegate = self;
    }
    return _contentF;
}

- (void)wd_textFieldDeleteBackward:(WDTextField *)textField
{
    NSLog(@"文本框输入的值 == %@",textField);
//    NSString * string = [textField.text substringFromIndex:[textField.text length]-1];
        if (self.currIndex == 0) {//待输入的下标为0时 删除时下标不变化，否则下标减1
            self.codeViewsArr[self.currIndex].text = @"";
        } else {
            self.codeViewsArr[--self.currIndex].text = @"";
            if (self.codeResignUnCompleted) {
                NSString *content = [textField.text substringToIndex:self.currIndex];
                self.codeResignUnCompleted(content);
            }
        }
       
}


- (NSArray<KLCodeView *> *)codeViewsArr {
    if (!_codeViewsArr) {
        NSMutableArray *arr = [NSMutableArray array];
        for (NSInteger i = 0; i < self.codeBits; i++) {
            KLCodeView *codeView = [[KLCodeView alloc] init];
            if (i == 0) {
                codeView.aniLine.hidden = NO;
               [codeView.aniLine addAnimation:[self opacityAnimation] forKey:@"kOpacityAnimation"];
            }
            [arr addObject:codeView];
        }
        _codeViewsArr = [NSArray arrayWithArray:arr];
    }
    return _codeViewsArr;
}

//判断一个字符串是都是纯数字
- (BOOL)judgePureInt:(NSString *)content {
    NSScanner *scan = [NSScanner scannerWithString:content];
    int val;
    return [scan scanInt:&val] && [scan isAtEnd];
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}



@end


@implementation UITextField (ForbiddenSelect)

/*
 该函数控制是否允许 选择 全选 剪切 f粘贴等功能，可以针对不同功能进行限制
 返回YES表示允许对应的功能，返回NO则表示不允许对应的功能
 直接返回NO则表示不允许任何编辑
 */
- (BOOL)canPerformAction:(SEL)action withSender:(id)sender {
    return NO;
}

@end


//验证码展示视图 的实现
@implementation KLCodeView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        WEAKSELF
        self.backgroundColor = [UIColor whiteColor];
        self.userInteractionEnabled = NO;
        //数字编码 label
        _codeLabel = [[UILabel alloc] init];
        _codeLabel.textColor = [UIColor blueColor];
        _codeLabel.font = [UIFont systemFontOfSize:25];
        _codeLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_codeLabel];
        [_codeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.mas_equalTo(weakSelf).mas_offset(0.0f);
            make.bottom.mas_equalTo(weakSelf).mas_offset(-10.0f);
        }];
        
        _lineView = [[UIView alloc] init];
        _lineView.backgroundColor = [UIColor grayColor];
        [self addSubview:_lineView];
        [_lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.left.right.mas_equalTo(weakSelf).mas_offset(0.0f);
            make.height.mas_equalTo(2.0f);
        }];
       
//        TODO:- 添加lineview
        // 0.1秒后获取frame， 设置为0秒也可以获取，具体参考链接
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            NSLog(@"当前view = %@",self);
            CGRect rect = CGRectMake((CGRectGetHeight(self.frame)-2)/2,5,1,(CGRectGetHeight(self.frame)-10));
            UIBezierPath *path = [UIBezierPath bezierPathWithRect:rect];
            CAShapeLayer *line = [CAShapeLayer layer];
            line.path = path.CGPath;
            line.fillColor =  [UIColor cyanColor].CGColor;
            [self.layer addSublayer:line];
            self.aniLine = line;
            self.aniLine.hidden = YES;
//            if (i == 0) {//初始化第一个view为选择状态
//                [line addAnimation:[self opacityAnimation] forKey:@"kOpacityAnimation"];
//                line.hidden = NO;
//                subView.borderColor = _viewColorHL;
//            }else{
//                line.hidden = YES;
//                subView.borderColor = _viewColor;
//            }
            
        });
     

        
        
        
    }
    return self;
}

- (void)setText:(NSString *)text {
    if (text.length > 0) {
        self.codeLabel.text = [text substringToIndex:1];
        self.lineView.backgroundColor = [UIColor blueColor];
    } else {
        self.codeLabel.text = @"";
        self.lineView.backgroundColor = [UIColor grayColor];
    }
}

- (void)changeViewLayerIndex:(NSInteger)index pointHidden:(BOOL)hidden{
    
//    UIView *view = self.codeViewsArr[index];
//    view.borderColor = hidden?_viewColor:_viewColorHL;
//    CAShapeLayer *line =self.pointlineArr[index];
//    if (hidden) {
//        [line removeAnimationForKey:@"kOpacityAnimation"];
//    }else{
//        [line addAnimation:[self opacityAnimation] forKey:@"kOpacityAnimation"];
//    }
//    line.hidden = hidden;

}

- (CABasicAnimation *)opacityAnimation {
    CABasicAnimation *opacityAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    opacityAnimation.fromValue = @(1.0);
    opacityAnimation.toValue = @(0.0);
    opacityAnimation.duration = 0.9;
    opacityAnimation.repeatCount = HUGE_VALF;
    opacityAnimation.removedOnCompletion = YES;
    opacityAnimation.fillMode = kCAFillModeForwards;
    opacityAnimation.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    return opacityAnimation;
}

@end

