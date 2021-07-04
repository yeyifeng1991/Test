//
//  AniViewController.m
//  Test
//
//  Created by 叶义峰 on 2021/6/6.
//

#import "AniViewController.h"

@interface AniViewController ()
@property (nonatomic,strong) UIButton  * aniBtn ;

@end

@implementation AniViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self archintFrame];
    
    
    
    
    
    //    [self.view addSubview:self.aniBtn];
}
- (void)archintFrame{
    UIView *  subViewOne = [[UIView alloc] initWithFrame:CGRectMake(100.f, 100.f, 100.f, 100.f)];
    subViewOne.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:subViewOne];
    
    UIView *   subView = [[UIView alloc] init];
    subView.frame = CGRectMake(100.f, 100.f, 100.f, 100.f);
    //     默认锚点是(0.5,0.5) (1,1)是左上角 (0,0)是右下角
    //       subView.layer.anchorPoint = CGPointMake(1, 1);
    subView.layer.anchorPoint = CGPointMake(0, 0);
    subView.transform = CGAffineTransformMakeRotation(M_PI_2/2);
    
    subView.backgroundColor = [UIColor redColor];
    [self.view addSubview:subView];
    
    
    
//    - AnchorPoint 的改变与 position 无关，但是frame改变了
//    - AnchorPoint的 位置 就是 position的位置
//    - position 是 AnchorPoint 在父view上的位置
//    - frema 本质是根据 position、bouns、AnchorPoint计算出来的
//    - 我要钉一副画（bouns）到到墙上，那么我这个钉子钉的位置就是 position
//    - 先改变AnchorPoint在图形上的位置，再让图形随着AnchorPoint，把AnchorPoint放到position的位置
}

- (UIButton * )aniBtn {
    if (!_aniBtn) {
        _aniBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 100, 100, 50)];
        //        _aniBtn.frame = CGRectFrame:(x:)
        [_aniBtn setTitle: @"移动动画" forState:UIControlStateNormal];
        _aniBtn.layer.cornerRadius =  32/2;
        _aniBtn.layer.masksToBounds = YES;
        _aniBtn.titleLabel.font = TKFont(15);
        [_aniBtn setBackgroundColor:[UIColor cyanColor]];
        
        
    }
    return _aniBtn;
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
