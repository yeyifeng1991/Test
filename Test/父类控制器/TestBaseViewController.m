//
//  TestBaseViewController.m
//  Test
//
//  Created by 叶义峰 on 2021/4/7.
//

#import "TestBaseViewController.h"
#import "Masonry.h"

@interface TestBaseViewController ()

@end

@implementation TestBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self initTableView];
    
//    self.superLabel.text = @"父类lablel";
//    self.superLabel1.text = @"父类lablel1";
//    self.superLabel2.text = @"父类lablel2";
//    [self subClick];

    
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        
//    });
//    [self performSelector:@selector(tapTable)];
//    [self tapTable:nil];
}
//+(void)subClick{
//    NSLog(@"当前类的类方法方法接收到");
//}
- (void)initTableView {
        self.tableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds];
        self.tableView.dataSource = self;
        [self.view addSubview:self.tableView];
}

- (void)subClick{
    NSLog(@"父类实现子类方法");
}

- (UILabel *)superLabel{
    if (!_superLabel) {
        _superLabel = [[UILabel alloc] initWithFrame:CGRectMake(50, 50, 200, 30)];
        _superLabel.text = @"父类lablel";
        _superLabel.textColor = [UIColor blackColor];
        _superLabel.backgroundColor = [UIColor redColor];
        [self.view addSubview:_superLabel];
    }
    return _superLabel;
}

- (UILabel *)superLabel1{
    if (!_superLabel1) {
        _superLabel1 = [[UILabel alloc] initWithFrame:CGRectMake(50, 100, 200, 30)];
        _superLabel1.text = @"父类lablel";
        _superLabel1.textColor = [UIColor blackColor];
        _superLabel1.backgroundColor = [UIColor redColor];
        [self.view addSubview:_superLabel1];
    }
    return _superLabel1;
}

-(UILabel *)superLabel2{
   if (!_superLabel2) {
       _superLabel2 = [[UILabel alloc] initWithFrame:CGRectMake(50, 150, 200, 30)];
       _superLabel2.text = @"父类lablel";
       _superLabel2.textColor = [UIColor blackColor];
       _superLabel2.backgroundColor = [UIColor redColor];
       [self.view addSubview:_superLabel2];
   }
   return _superLabel2;
}
- (void)updateMvVideoForPeerID:(NSString *)aPeerId {
    
    NSDictionary *tVideoViewDic = (NSDictionary *)[_iMvVideoDic objectForKey:aPeerId];
    if (!tVideoViewDic) {
        tVideoViewDic = [@{} mutableCopy];
    }
    NSMutableDictionary *tVideoViewDicNew =
    [NSMutableDictionary dictionaryWithDictionary:tVideoViewDic];
    [tVideoViewDicNew setObject:@NO forKey:@"isDrag"];
    [tVideoViewDicNew setObject:@(0) forKey:@"percentTop"];
    [tVideoViewDicNew setObject:@(0) forKey:@"percentLeft"];
    _iMvVideoDic = tVideoViewDicNew;
//    [_iMvVideoDic setObject:tVideoViewDicNew forKey:aPeerId];
}

- (void)addSubView:(TestView*)subview superView:(UIView*)superview;
{
    TestView *tView =  [[TestView alloc] init];
    tView.backgroundColor = [UIColor redColor];
    NSLog(@"setupViews 执行");
    [superview addSubview:tView];
//       make.edges.equalTo(self.view.window).insets(UIEdgeInsetsMake( 0, 0, 0, 0));
    [tView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(self.view.mas_left).offset(5);
//        make.right.equalTo(self.view.mas_right).offset(-5);
//        make.top.equalTo(self.view.mas_top).offset(5);
//        make.bottom.equalTo(self.view.mas_bottom).offset(-5);
//        make.edges.equalTo(superview).insets(UIEdgeInsetsMake(5, 5, 5, 5));
        make.center.equalTo(superview);
//        make.width.equalTo(@(self.view.bounds.size.width/3));
//        make.height.equalTo(@(self.view.bounds.size.height/3));
    }];
    
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.layer.masksToBounds = YES;
    imageView.backgroundColor = [UIColor cyanColor];

    imageView.layer.cornerRadius = 10;
//    imageView.image = image;
    [tView addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(tView).insets(UIEdgeInsetsMake(5, 5, 5, 5));
        make.width.equalTo(@(UIScreen.mainScreen.bounds.size.width / 3));
        make.height.equalTo(@(UIScreen.mainScreen.bounds.size.height / 3));
    }];
    
    [imageView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(UIScreen.mainScreen.bounds.size.width / 7));
        make.height.equalTo(@(UIScreen.mainScreen.bounds.size.height / 7));
    }];
    
    [UIView animateWithDuration:5.0f animations:^{
        [self.view setNeedsLayout];
        [self.view layoutIfNeeded];
        
    } completion:^(BOOL finished) {
       
        [tView removeFromSuperview];
        
    }];
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
