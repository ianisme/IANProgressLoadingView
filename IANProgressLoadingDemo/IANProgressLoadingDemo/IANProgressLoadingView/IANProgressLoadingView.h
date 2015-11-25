//
//  IANProgressLoadingView.h
//  IANProgressLoadingDemo
//
//  Created by ian on 15/11/25.
//  Copyright © 2015年 ian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IANProgressLoadingView : UIView

+ (instancetype)progressView:(UIView *)view;
+ (instancetype)progressView:(UIView *)view withUserInteractionEnabled:(BOOL)enabled;
- (void)dismiss;

- (void)changeProgressText:(NSString *)text;

@end
