//
//  EOGImageDemoController.h
//  UsefulThirdsControlsDemo
//
//  Created by Kino on 13-8-21.
//  Copyright (c) 2013年 Kino. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EGOImageView.h"

@interface EOGImageDemoController : UIViewController<EGOImageViewDelegate>

@property (retain, nonatomic) EGOImageView *imageView;
@property (retain, nonatomic) UIProgressView *progressBar;
- (void)reloadButton:(id)sender;

@end
