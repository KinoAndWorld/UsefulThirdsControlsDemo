//
//  LeftViewController.m
//  UsefulThirdsControlsDemo
//
//  Created by Kino on 13-8-20.
//  Copyright (c) 2013年 Kino. All rights reserved.
//

#import "LeftViewController.h"
#import "CenterViewController.h"
#import "CenterViewController2.h"
#import "UIViewController+MMDrawerController.h"

@interface LeftViewController (){
    NSArray *arr;
}
@end

@implementation LeftViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    if(self.tableView == nil){
        UITableView *tb = [[UITableView alloc] initWithFrame:self.view.bounds];
        self.tableView = tb;
        [tb release];
    }
    //self.tableView.delegate = self;
    //self.tableView.dataSource = self;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    arr = [@[@"首页",@"其他",@"设置"]retain];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc{
    
    [super dealloc];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [arr count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    // Configure the cell...
    cell.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.9];
    cell.textLabel.text = arr[indexPath.row];
    
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%@",self.mm_drawerController);
    if (indexPath.row == 0) {
        [self.mm_drawerController setCenterViewController:self.center withCloseAnimation:YES completion:nil];
    }else{
        CenterViewController2 *cent2 = [[CenterViewController2 alloc] init];
        [self.mm_drawerController setCenterViewController:cent2 withCloseAnimation:YES completion:nil];
        [cent2 release];
    }
}

@end
