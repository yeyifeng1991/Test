//
//  TelephoneCodeViewController.m
//  Test
//
//  Created by 叶义峰 on 2021/5/10.
//

#import<CoreTelephony/CTCarrier.h>
#import <CoreTelephony/CTTelephonyNetworkInfo.h>
#import "TelephoneCodeViewController.h"

@interface TelephoneCodeViewController ()

@end

@implementation TelephoneCodeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CTTelephonyNetworkInfo *network_Info = [CTTelephonyNetworkInfo new];
    CTCarrier *carrier = network_Info.serviceSubscriberCellularProviders;

    NSLog(@"country code is: %@", carrier.mobileCountryCode);

    //will return the actual country code
    NSLog(@"ISO country code is: %@", carrier.isoCountryCode);
    
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
