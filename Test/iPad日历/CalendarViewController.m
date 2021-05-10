//
//  CalendarViewController.m
//  Test
//  日历界面
//  Created by 叶义峰 on 2021/5/7.
//

#import "CalendarViewController.h"
#import "FSCalendar.h"


@interface CalendarViewController()
@property (nonatomic ,strong) FSCalendar * calendar;

@end

@implementation CalendarViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (void)loadView
{
    UIView *view = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    view.backgroundColor = [UIColor systemGroupedBackgroundColor];
    self.view = view;
    
    FSCalendar *calendar = [[FSCalendar alloc] initWithFrame:CGRectMake(0, 64, view.frame.size.width, 300)];
    calendar.dataSource = self;
    calendar.delegate = self;
    calendar.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:calendar];
    self.calendar = calendar;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
