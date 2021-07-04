//
//  CustomView.m
//  Test
//
//  Created by 叶义峰 on 2021/6/30.
//

#import "CustomView.h"

#define ScreenW [UIScreen mainScreen].bounds.size.width
#define ScreenH [UIScreen mainScreen].bounds.size.[UIScreen mainScreen].bounds.size.height


@interface CustomView ()

@end

@implementation CustomView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        UILabel * topL = [[UILabel alloc] init];
        //    label.text = TKMTLocalized(<#s#>)
        topL.text = @"前jdwoj你带我去年到外派我当前jdwoj你带我去年到外派我当前jdwoj你带我去年到外派我当前jdwoj你带我去年到外派我当前jdwoj";
        topL.numberOfLines = 0;
        topL.textColor = UIColorRGB(0x8F92A1);
        topL.textAlignment = NSTextAlignmentLeft;
        [self addSubview:topL];
        [topL mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_offset(10);
            make.left.mas_offset(0);
            make.width.mas_equalTo(ScreenW);
            make.height.mas_equalTo(30);
            //        make.size.mas_equalTo(CGSizeMake(FitW(400), FitH(40)));
            
        }];
        
        
        UILabel * desLabel = [[UILabel alloc] init];
        desLabel.text = @"你带我去年到外派我当前jdwoj你带我去年到外派我当前jdwoj你带我去年到外派我当前jdwoj你带我去年到外派我当前jdwoj你带我去年到外派我当前jdwoj你带我去年到外派我当前jdwoj你带我去年到外派我当前jdwoj我去年到外派我当前jdwoj你带我去年到外派我当前jdwoj你带我去年到外派我当前jdwoj你带我去年到外派我当前jdwoj你带我去年到外派我当前jdwoj你带我去年到外派我当前jdwoj我去年到外派我当前jdwoj你带我去年到外派我当前jdwoj你带我去年到外派我当前jdwoj你带我去年到外派我当前jdwoj你带我去年到外派我当前jdwoj你带我去年到外派我当前jdwoj我去年到外派我当前jdwoj你带我去年到外派我当前jdwoj你带我去年到外派我当前jdwoj你带我去年到外派我当前jdwoj你带我去年到外派我当前jdwoj你带我去年到外派我当前jdwoj我去年到外派我当前jdwoj你带我去年到外派我当前jdwoj你带我去年到外派我当前jdwoj你带我去年到外派我当前jdwoj你带我去年到外派我当前jdwoj你带我去年到外派我当前jdwoj";
        desLabel.numberOfLines = 0;
        desLabel.textColor = UIColorRGB(0x8F92A1);
        desLabel.textAlignment = NSTextAlignmentLeft;
        [desLabel setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisVertical];//设置huggingPriority
        [self addSubview:desLabel];
        [desLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(topL.mas_bottom).offset(10);
            make.left.mas_offset(0);
            make.width.mas_equalTo(ScreenW);

        }];

//
//
        UIImageView * cyanimageV = [[UIImageView alloc] init];
        cyanimageV.backgroundColor = [UIColor cyanColor];
        [self addSubview:cyanimageV];
        [cyanimageV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(desLabel.mas_bottom).offset(10);
            make.centerX.equalTo(self);
            make.size.mas_equalTo(CGSizeMake(300, 50));
        }];

//
//
        UIImageView * redimageV1 = [[UIImageView alloc] init];
        redimageV1.backgroundColor = [UIColor redColor];
        [self addSubview:redimageV1];
        [redimageV1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(cyanimageV.mas_bottom).offset(10);
            make.centerX.equalTo(self);
            make.size.mas_equalTo(CGSizeMake(300, 150));
        }];

        
        UIImageView * cyanimageV2 = [[UIImageView alloc] init];
        cyanimageV2.backgroundColor = [UIColor cyanColor];
        [self addSubview:cyanimageV2];
        [cyanimageV2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(redimageV1.mas_bottom).offset(10);
            make.centerX.equalTo(self);
            make.size.mas_equalTo(CGSizeMake(300, 250));
        }];

//
//
        UIImageView * redimageV2 = [[UIImageView alloc] init];
        redimageV2.backgroundColor = [UIColor redColor];
        [self addSubview:redimageV2];
        [redimageV2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(cyanimageV2.mas_bottom).offset(10);
            make.centerX.equalTo(self);
            make.size.mas_equalTo(CGSizeMake(300, 50));
        }];

        
        
        [self mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.greaterThanOrEqualTo(redimageV2).offset(20);
        }];
        
    }
    return self;
}

@end
