//
//  ViewController.m
//  UsefulThirdsControlsDemo
//
//  Created by Kino on 13-8-20.
//  Copyright (c) 2013年 Kino. All rights reserved.
//

#import "ViewController.h"
#import "EGOTableViewPullRefreshDemoViewController.h"

#import "MMDrawerController.h"
#import "LeftViewController.h"
#import "CenterViewController.h"

#import "EOGImageDemoController.h"

#import "PZPhotoViewDemoViewController.h"

@interface ViewController ()
@property(nonatomic, retain) EGOTableViewPullRefreshDemoViewController *egoPull;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    _egoPull = [[EGOTableViewPullRefreshDemoViewController alloc] init];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)showViewcontroller:(id)sender {
    switch ([sender tag]) {
        case 0:
            [self.navigationController pushViewController:_egoPull animated:YES];
            break;
        case 1:
            [self showMMDraeVC];
            break;
        case 2:
            [self showEOGImageVC];
            break;
        case 3:
            [self showPZPhotoVC];
            break;
        default:
            break;
    }
}

- (void)showMMDraeVC{
    LeftViewController * leftDrawer = [[LeftViewController alloc] init];
    //leftDrawer.view.backgroundColor = [UIColor yellowColor];
    CenterViewController * center = [[CenterViewController alloc] init];
    center.view.backgroundColor = [UIColor brownColor];
    UIViewController * rightDrawer = [[UIViewController alloc] init];
    rightDrawer.view.backgroundColor = [UIColor grayColor];
    
    leftDrawer.center = center;
    MMDrawerController * drawerController = [[MMDrawerController alloc]
                                             initWithCenterViewController:center
                                             leftDrawerViewController:leftDrawer
                                             rightDrawerViewController:rightDrawer];
    
    [drawerController setRestorationIdentifier:@"MMDrawer"];
    [drawerController setMaximumRightDrawerWidth:200.0];
    [drawerController setOpenDrawerGestureModeMask:MMOpenDrawerGestureModeAll];
    [drawerController setCloseDrawerGestureModeMask:MMCloseDrawerGestureModeAll];
    
    [self.navigationController pushViewController:drawerController animated:YES];
    
    [leftDrawer release];
    [center release];
    [rightDrawer release];
    [drawerController release];
}

- (void)showEOGImageVC{
    EOGImageDemoController *egoVC = [[EOGImageDemoController alloc] init];
    [self.navigationController pushViewController:egoVC animated:YES];
    [egoVC release];
}

- (void)showPZPhotoVC{
    PZPhotoViewDemoViewController *pz = [[PZPhotoViewDemoViewController alloc] init];
    [self.navigationController pushViewController:pz animated:YES];
    [pz release];
}

@end
