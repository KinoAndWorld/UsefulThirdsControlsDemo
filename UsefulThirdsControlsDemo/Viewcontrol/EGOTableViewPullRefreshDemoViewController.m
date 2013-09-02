//
//  EGOTableViewPullRefreshDemoViewController.m
//  EGOTableViewPullRefreshDemo
//
//  Created by Emre Berge Ergenekon on 9/19/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "EGOTableViewPullRefreshDemoViewController.h"

@implementation EGOTableViewPullRefreshDemoViewController
@synthesize pullTableView;

#pragma mark - View lifecycle


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.pullTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    self.pullTableView.pullArrowImage = [UIImage imageNamed:@"blackArrow"];
    self.pullTableView.pullBackgroundColor = [UIColor yellowColor];
    self.pullTableView.pullTextColor = [UIColor blackColor];
    
    testArray = [[NSMutableArray alloc] initWithCapacity:20];
    for (int i = 0; i < 5; i++) {
        [testArray addObject:[NSString stringWithFormat:@"%d",i]];
    }
}


- (void)viewDidUnload{
    [self setPullTableView:nil];
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)dealloc {
    [pullTableView release];
    [testArray release];
    [super dealloc];
}

#pragma mark - Refresh and load more methods

//完成上拉刷新
- (void) refreshTable
{
    [testArray addObject:@"new data from 上拉刷新"];
    [self.pullTableView insertRowsAtIndexPaths:[NSArray arrayWithObject:[NSIndexPath indexPathForRow:[testArray count]-1 inSection:0]] withRowAnimation:UITableViewRowAnimationMiddle];
    //======================
    self.pullTableView.pullLastRefreshDate = [NSDate date];
    self.pullTableView.pullTableIsRefreshing = NO;
}

//完成加载更多
- (void) loadMoreDataToTable
{
    [testArray addObject:@"new data from 加载更多"];
    [self.pullTableView insertRowsAtIndexPaths:[NSArray arrayWithObject:[NSIndexPath indexPathForRow:[testArray count]-1 inSection:0]] withRowAnimation:UITableViewRowAnimationLeft];
    
    self.pullTableView.pullTableIsLoadingMore = NO;
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [testArray count];
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    cell.textLabel.text =  [testArray objectAtIndex:indexPath.row];
    
    return cell;
}


#pragma mark - PullTableViewDelegate

- (void)pullTableViewDidTriggerRefresh:(PullTableView *)pullTableView{
    [self performSelector:@selector(refreshTable) withObject:nil afterDelay:3.0f];
}

- (void)pullTableViewDidTriggerLoadMore:(PullTableView *)pullTableView{
    [self performSelector:@selector(loadMoreDataToTable) withObject:nil afterDelay:3.0f];
}

@end
