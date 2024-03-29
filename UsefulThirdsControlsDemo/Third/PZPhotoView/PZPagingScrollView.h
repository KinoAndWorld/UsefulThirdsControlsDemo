//
//  PZPagingScrollView.h
//  PhotoZoom
//
//  Created by Brennan Stehling on 11/9/12.
//  Copyright (c) 2012 SmallSharptools LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PZPagingScrollViewDelegate;

@interface PZPagingScrollView : UIScrollView

@property (assign, nonatomic) id<PZPagingScrollViewDelegate>pagingViewDelegate;
@property (readonly) UIView *visiblePageView;
@property (assign) BOOL suspendTiling;
@property (assign, nonatomic) NSInteger padding;

- (id)initWithFrame:(CGRect)frame andPadding:(NSInteger)padding;
- (void)displayPagingViewAtIndex:(NSUInteger)index;
- (void)resetDisplay;

- (NSInteger)getCurrentPage;

- (UIView *)visiblePageViewNext;
- (UIView *)visiblePageViewPre;

@end

@protocol PZPagingScrollViewDelegate <NSObject>

@required

- (Class)pagingScrollView:(PZPagingScrollView *)pagingScrollView classForIndex:(NSUInteger)index;
- (NSUInteger)pagingScrollViewPagingViewCount:(PZPagingScrollView *)pagingScrollView;
- (UIView *)pagingScrollView:(PZPagingScrollView *)pagingScrollView pageViewForIndex:(NSUInteger)index;
- (void)pagingScrollView:(PZPagingScrollView *)pagingScrollView preparePageViewForDisplay:(UIView *)pageView forIndex:(NSUInteger)index;
@optional
- (void)pagingScrollView:(PZPagingScrollView *)pagingScrollView adjustView:(UIView *)view isCurrentView:(BOOL)isCurrentView;
@end
