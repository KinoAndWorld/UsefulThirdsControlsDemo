//
//  EOGImageDemoController.m
//  UsefulThirdsControlsDemo
//
//  Created by Kino on 13-8-21.
//  Copyright (c) 2013年 Kino. All rights reserved.
//

#import "EOGImageDemoController.h"
#import "EGOCache.h"

@interface EOGImageDemoController (){
    long long sumProgress;//进度
    float curProgrss;
    NSArray *images;
}
@end

@implementation EOGImageDemoController


- (void)viewDidLoad
{
    [super viewDidLoad];
	_imageView = [[EGOImageView alloc] initWithFrame:CGRectMake(10, 20, 300, 250)];
    _progressBar = [[UIProgressView alloc] initWithFrame:CGRectMake(10, 250, 300, 30)];
    [self.view addSubview:_imageView];
    [self.view addSubview:_progressBar];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn.frame = CGRectMake(120, 400, 80, 40);
    [btn setTitle:@"重新加载" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(reloadButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    
    images = [[NSArray alloc] initWithObjects:
              @"http://b.zol-img.com.cn/desk/bizhi/image/3/960x600/1368690909238.jpg",
              @"http://b.zol-img.com.cn/desk/bizhi/image/3/1920x1200/1375321522812.jpg",
              @"http://b.zol-img.com.cn/desk/bizhi/image/3/1680x1050/137532155071.jpg",
              @"http://b.zol-img.com.cn/desk/bizhi/image/3/1920x1200/1375321297950.jpg",
              @"http://b.zol-img.com.cn/desk/bizhi/image/3/1920x1200/1375321319613.jpg",nil];
    self.imageView.delegate = self;
}

- (void)imageViewImageProgress:(long long)bytes{
    //NSLog(@"sub:%lld",bytes);
    float progress = bytes / (sumProgress * 1.0);
    curProgrss += progress;
    //NSLog(@"加载进度:%f",curProgrss);
    self.progressBar.progress = curProgrss;
}
- (void)imageViewImageProgressCount:(long long)bytes{
    //NSLog(@"Total:%lld",bytes);
    sumProgress = 0.0;
    curProgrss = 0.0;
    sumProgress = bytes;
}


- (void)reloadButton:(id)sender {
    self.imageView.image = nil;
    self.progressBar.progress = 0.0;
    [[EGOCache currentCache] clearCache];
    double delayInSeconds = 0.3;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        int index = arc4random() % 5;
        self.imageView.imageURL = [NSURL URLWithString:[images objectAtIndex:index]];
    });
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_imageView release];
    [_progressBar release];
    [super dealloc];
}

@end
