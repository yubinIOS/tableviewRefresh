
//
//  AAAAA.m
//  asdfasdfasdfasdfas
//
//  Created by ZNM_YuBin on 15/8/25.
//  Copyright (c) 2015年 YuBin. All rights reserved.
//

#import "FootView.h"

@interface FootView ()<UIScrollViewDelegate>

@property (nonatomic,strong)UIImageView * iconView;
@property (nonatomic,strong)UIActivityIndicatorView * indicator;

@property (nonatomic,strong)UILabel * labelText;

@end

@implementation FootView

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.frame = frame;
        self.backgroundColor = [UIColor clearColor];
        CGFloat leftWeight = 15;
        
        UILabel * labelLine = [[UILabel alloc] initWithFrame:CGRectMake(leftWeight, 0, [UIScreen mainScreen].bounds.size.width - leftWeight, 0.5)];
        [self addSubview:labelLine];
        labelLine.backgroundColor = [UIColor colorWithWhite:0.8 alpha:1];
        
        
        UIImage * icon = [UIImage imageNamed:@"top"];
        self.iconView = [[UIImageView alloc] initWithFrame:CGRectMake(([UIScreen mainScreen].bounds.size.width - 15)/2, 10, 15, 40)];
        [self addSubview:self.iconView];
        self.iconView.image = icon;
        
        self.indicator = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width/2 - 25, 0, 50, 50)];
        [self addSubview:self.indicator];
        self.indicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;
        
        self.labelText = [[UILabel alloc] initWithFrame:self.bounds];
        [self addSubview:self.labelText];
        self.labelText.textAlignment = NSTextAlignmentCenter;
        self.labelText.textColor = [UIColor colorWithWhite:0.8 alpha:1];
        self.labelText.text = @"没有更多内容";
        self.labelText.hidden = YES;
        
    }
    return self;
}

-(void)UpdateViewWithState:(NSInteger)state
{
    if (state == viewStateLastBeforeLoging)
    {
        self.iconView.hidden = NO;
        self.indicator.hidden = YES;
        self.labelText.hidden = YES;

    }
    else if (state == viewStateLastLoging)
    {
        self.iconView.hidden = YES;
        self.indicator.hidden = NO;
        [self.indicator startAnimating];
        self.labelText.hidden = YES;

    }
    else if (state == viewStateLastAfterLoging)
    {
        self.iconView.hidden = YES;
        [self.indicator stopAnimating];
        self.indicator.hidden = YES;
        self.labelText.hidden = YES;

    }
    else if (state == viewStateLastNull)
    {
        self.iconView.hidden = YES;
        self.indicator.hidden = YES;
        self.labelText.hidden = NO;

        
    }

}



@end
