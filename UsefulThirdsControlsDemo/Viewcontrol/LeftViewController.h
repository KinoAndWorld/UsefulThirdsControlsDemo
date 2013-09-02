//
//  LeftViewController.h
//  UsefulThirdsControlsDemo
//
//  Created by Kino on 13-8-20.
//  Copyright (c) 2013年 Kino. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CenterViewController;

@interface LeftViewController : UITableViewController<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, retain) CenterViewController *center;

@end
