//
//  ViewController.m
//  IANProgressLoadingDemo
//
//  Created by ian on 15/11/25.
//  Copyright © 2015年 ian. All rights reserved.
//

#import "ViewController.h"
#import "IANProgressLoadingView.h"

@interface ViewController ()

@property (nonatomic, strong) IANProgressLoadingView *loadingView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(self.view.center.x - 30, 60, 60, 30);
    btn.layer.borderColor = [UIColor blueColor].CGColor;
    btn.layer.borderWidth = 1.f;
    btn.layer.cornerRadius = 5;
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn setTitleColor:[[UIColor blackColor] colorWithAlphaComponent:0.4f] forState:UIControlStateHighlighted];
    [btn setTitle:@"start" forState:UIControlStateNormal];
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(Click:) forControlEvents:UIControlEventTouchUpInside];

    [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(function:) userInfo:nil repeats:YES];

    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)Click:(UIButton *)btn
{
    if (btn.selected) {
        btn.selected = NO;
        [btn setTitle:@"start" forState:UIControlStateNormal];
        [_loadingView dismiss];
    } else {
        btn.selected = YES;
        [btn setTitle:@"end" forState:UIControlStateNormal];
        _loadingView = [IANProgressLoadingView progressView:self.view withUserInteractionEnabled:YES];
    }
}

- (void)function:(id)sender
{
    [_loadingView changeProgressText:[NSString stringWithFormat:@"%zd%@",arc4random() % 100, @"%"]];
}

@end
