//
//  IANProgressLoadingView.m
//  IANProgressLoadingDemo
//
//  Created by ian on 15/11/25.
//  Copyright © 2015年 ian. All rights reserved.
//

#import "IANProgressLoadingView.h"

static NSUInteger const IANhubViewWith = 100;
static NSUInteger const IANhubViewHeight = 100;
static NSUInteger const IANProgressLabelWidth = 100;
static NSUInteger const IANProgressLabelHeight = 17;

@interface IANProgressLoadingView()

@property (nonatomic, strong) UIView *hudView;
@property (nonatomic, strong) UIActivityIndicatorView *loadingView;
@property (nonatomic, strong) UILabel *progressLabel;

@end

@implementation IANProgressLoadingView

+ (instancetype)progressView:(UIView *)view
{
    return [self progressView:view withUserInteractionEnabled:NO];
}

+ (instancetype)progressView:(UIView *)view withUserInteractionEnabled:(BOOL)enabled
{
    IANProgressLoadingView *myView = [[self alloc] initViewWithUserInteractionEnabled:!enabled];
    [view addSubview:myView];
    return myView;
}

- (void)dismiss
{
    [self removeFromSuperview];
}

- (void)changeProgressText:(NSString *)text
{
    if (!_progressLabel) {
        return;
    }
    _progressLabel.text = text;
}

#pragma mark - private method
- (instancetype)initViewWithUserInteractionEnabled:(BOOL)enabled
{
    self = [super init];
    if (self) {
        self = [[[self class] alloc]init];
        self.frame = [UIScreen mainScreen].bounds;
        self.userInteractionEnabled = enabled;
        [self creatProgressViewWithUserInteractionEnabled:enabled];
    }
    return self;
}

- (void)creatProgressViewWithUserInteractionEnabled:(BOOL)enabled
{
    self.hudView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.7];
    self.hudView.userInteractionEnabled = enabled;
    [self addSubview:self.hudView];
}

- (UIActivityIndicatorView *)loadingView
{
    UIActivityIndicatorView *testActivityIndicator = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    testActivityIndicator.frame = CGRectMake(0, 0, IANhubViewWith, IANhubViewHeight*0.8);
    testActivityIndicator.color = [UIColor whiteColor];
    [testActivityIndicator startAnimating];
    return testActivityIndicator;
}

- (UIView *)hudView
{
    if (!_hudView) {
        _hudView = [[UIView alloc] initWithFrame:CGRectMake(self.bounds.size.width/2 - IANhubViewWith/2, self.bounds.size.height/2 - IANhubViewHeight/2, IANhubViewWith, IANhubViewHeight)];
        _hudView.clipsToBounds = YES;
        _hudView.layer.cornerRadius = 10;
        [_hudView addSubview:self.loadingView];
        [_hudView addSubview:self.progressLabel];
    }
    return _hudView;
}

- (UILabel *)progressLabel
{
    if (!_progressLabel) {
        _progressLabel = [[UILabel alloc] initWithFrame:CGRectMake(IANhubViewWith/2 - IANProgressLabelWidth/2, IANhubViewWith/2 - IANProgressLabelHeight/2 + 28, IANProgressLabelWidth, IANProgressLabelHeight)];
        _progressLabel.textAlignment = NSTextAlignmentCenter;
        _progressLabel.font  = [UIFont systemFontOfSize:12.0f];
        _progressLabel.textColor = [UIColor whiteColor];
    }
    return _progressLabel;
}


@end
