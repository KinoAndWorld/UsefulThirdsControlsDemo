//
//  PZPhotoViewDemoViewController.m
//  UsefulThirdsControlsDemo
//
//  Created by Kino on 13-8-21.
//  Copyright (c) 2013年 Kino. All rights reserved.
//

#import "PZPhotoViewDemoViewController.h"

#import "PZPagingScrollView.h"
#import "PZPhotoView.h"


@interface PZPhotoViewDemoViewController ()<PZPagingScrollViewDelegate , PZPhotoViewDelegate>

@end

@implementation PZPhotoViewDemoViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	[self loadPhotoView];
}

- (void)loadPhotoView{
    PZPagingScrollView *pagingScrollView = [[PZPagingScrollView alloc] initWithFrame:self.view.bounds andPadding:20];
    
    pagingScrollView.pagingViewDelegate = self;
    pagingScrollView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:pagingScrollView];
    
    [pagingScrollView displayPagingViewAtIndex:0];
}

#pragma mark - PZPagingScrollViewDelegate

- (Class)pagingScrollView:(PZPagingScrollView *)pagingScrollView classForIndex:(NSUInteger)index {
    return [PZPhotoView class];
}

- (NSUInteger)pagingScrollViewPagingViewCount:(PZPagingScrollView *)pagingScrollView {
    return 5;
}

- (UIView *)pagingScrollView:(PZPagingScrollView *)pagingScrollView pageViewForIndex:(NSUInteger)index {
    PZPhotoView *photoView = [[PZPhotoView alloc] initWithFrame:self.view.bounds];
    photoView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    photoView.photoViewDelegate = self;
    return photoView;
}

- (void)pagingScrollView:(PZPagingScrollView *)pagingScrollView preparePageViewForDisplay:(UIView *)pageView forIndex:(NSUInteger)index {
    PZPhotoView *photoView = (PZPhotoView *)pageView;
    photoView.padding = 20;
    UIImage *img = [UIImage imageNamed:[NSString stringWithFormat:@"%i.jpg",index]];
    [photoView displayImage:img];
}

- (void)pagingScrollView:(PZPagingScrollView *)pagingScrollView adjustView:(UIView *)view isCurrentView:(BOOL)isCurrentView{
    
}

#pragma mark - PZPhotoViewDelegate

- (void)photoViewDidSingleTap:(PZPhotoView *)photoView {}

- (void)photoViewDidDoubleTap:(PZPhotoView *)photoView{}
- (void)photoViewDidTwoFingerTap:(PZPhotoView *)photoView{}
- (void)photoViewDidDoubleTwoFingerTap:(PZPhotoView *)photoView{}


- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
}

@end
