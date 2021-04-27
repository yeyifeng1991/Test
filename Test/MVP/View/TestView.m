//
//  TestView.m
//  Test
//
//  Created by 叶义峰 on 2021/3/27.
//

#import "TestView.h"
#import "Masonry.h"

@implementation TestView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.nameLabel = [[UILabel alloc] initWithFrame:self.bounds];
        self.nameLabel.textAlignment = NSTextAlignmentCenter;
        self.nameLabel.backgroundColor = [UIColor cyanColor];
        [self addSubview:self.nameLabel];
        
    }
    return self;
}

- (void)changeFramerelyView:(UIView*)relyView
{
    NSLog(@"self == %@",self);
//    [self mas_remakeConstraints:^(MASConstraintMaker *make) {
//        make.edges.equalTo(relyView).insets(UIEdgeInsetsMake(20, 20, 20, 20));
//    }];
    
    for (UIView *view in self.subviews) {
        
        if ([view isKindOfClass:UILabel.class]) {
            view.hidden = true;
            
        }
    }
    
    
    self.frame = CGRectMake(10, 10, 200,400);
//    self.hidden = YES;
}

- (void)setCanTurnPage:(BOOL)canTurnPage{
    _canTurnPage = canTurnPage;
    NSLog(@"CanTurnPag set方法调用");
}

@end
