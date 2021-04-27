//
//  MasonryViewController.m
//  Test
//
//  Created by 叶义峰 on 2021/4/6.
//

#import "MasonryViewController.h"
#import "Masonry.h"
#import "SDAutoLayout.h"


@interface MasonryViewController ()

@end

@implementation MasonryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIView * view1 = [[UIView alloc] init];
    view1.backgroundColor = [UIColor redColor];
//    [self.view addSubview:view1];
    view1.sd_layout.leftSpaceToView(self.view, 20).topSpaceToView(self.view, 20).widthIs(100).heightIs(100);
    [self.view addSubview:view1];

//    [self scrollViewMasonry];
//    [self masonryAnimation];

}

- (void)masonryAnimation{
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = [UIColor cyanColor];
    [self.view addSubview:view];

    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(100);
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(50);
    }];

    //支持动画
//    [self.view layoutIfNeeded];
    [UIView animateWithDuration:1 animations:^{
        [view mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(400);
        }];
        [self.view layoutIfNeeded];
    }];

}

- (void)scrollViewMasonry {
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:UIScreen.mainScreen.bounds];
    UIView *contentV  = [[UIView alloc] init];
    UIView *firstV  = [[UIView alloc] init];
    firstV.backgroundColor = [UIColor cyanColor];
    UIView *secondV  = [[UIView alloc] init];
    secondV.backgroundColor = [UIColor redColor];

    [self.view addSubview:scrollView];
    [scrollView addSubview:contentV];
    [contentV addSubview:firstV];
    [contentV addSubview:secondV];

    [contentV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(scrollView);
        make.height.mas_equalTo(1000);
    }];
    [firstV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.mas_equalTo(0);
        make.left.mas_equalTo(16);//内容左约束
        make.width.mas_equalTo(100);
    }];
    [secondV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.mas_equalTo(0);
        make.left.mas_equalTo(firstV.mas_right).mas_offset(10);
        make.right.mas_equalTo(-16);//内容右约束
        make.width.mas_equalTo(100);
    }];

}

- (void)youxianji{
    //两个水平布局的label，两边间隔分别是12，中间间隔为8（懂意思就行）
    UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectZero];
    label1.backgroundColor = [UIColor redColor];
    label1.text = @"我是标题";
    [self.view addSubview:label1];
     [label1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.view);
        make.left.equalTo(@(12));
         make.width.greaterThanOrEqualTo(@(200));
     }];
        
    UILabel *label2 = [[UILabel alloc] initWithFrame:CGRectZero];
    label2.backgroundColor = [UIColor redColor];
    label2.text = @"我是描述";
    [self.view addSubview:label2];
    [label2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(label1);
        make.left.equalTo(label1.mas_right).offset(8);
        make.right.equalTo(self.view).offset(-12);
    }];

    
    [label1 setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
    [label1 setContentHuggingPriority:UILayoutPriorityDefaultLow forAxis:UILayoutConstraintAxisHorizontal];
    
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
