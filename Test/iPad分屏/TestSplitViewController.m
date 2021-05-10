//
//  TestSplitViewController.m
//  Test
//
//  Created by 叶义峰 on 2021/5/6.
//

#import "TestSplitViewController.h"

@interface TestSplitViewController ()<UISplitViewControllerDelegate>

@end

@implementation TestSplitViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
// This method allows a client to update any bar button items etc.
//- (void)splitViewController:(UISplitViewController *)svc willChangeToDisplayMode:(UISplitViewControllerDisplayMode)displayMode API_AVAILABLE(ios(8.0));

// Called by the gesture AND barButtonItem to determine what they will set the display mode to (and what the displayModeButtonItem's appearance will be.) Return UISplitViewControllerDisplayModeAutomatic to get the default behavior.
//- (UISplitViewControllerDisplayMode)targetDisplayModeForActionInSplitViewController:(UISplitViewController *)svc API_AVAILABLE(ios(8.0));{
//
//}

// Override this method to customize the behavior of `showViewController:` on a split view controller. Return YES to indicate that you've handled
// the action yourself; return NO to cause the default behavior to be executed.
//- (BOOL)splitViewController:(UISplitViewController *)splitViewController showViewController:(UIViewController *)vc sender:(nullable id)sender API_AVAILABLE(ios(8.0));

// Override this method to customize the behavior of `showDetailViewController:` on a split view controller. Return YES to indicate that you've
// handled the action yourself; return NO to cause the default behavior to be executed.
//- (BOOL)splitViewController:(UISplitViewController *)splitViewController showDetailViewController:(UIViewController *)vc sender:(nullable id)sender API_AVAILABLE(ios(8.0));

// Return the view controller which is to become the primary view controller after `splitViewController` is collapsed due to a transition to
// the horizontally-compact size class. If you return `nil`, then the argument will perform its default behavior (i.e. to use its current primary view
// controller).
//- (nullable UIViewController *)primaryViewControllerForCollapsingSplitViewController:(UISplitViewController *)splitViewController API_AVAILABLE(ios(8.0));

// Return the view controller which is to become the primary view controller after the `splitViewController` is expanded due to a transition
// to the horizontally-regular size class. If you return `nil`, then the argument will perform its default behavior (i.e. to use its current
// primary view controller.)
//- (nullable UIViewController *)primaryViewControllerForExpandingSplitViewController:(UISplitViewController *)splitViewController API_AVAILABLE(ios(8.0));


@end
