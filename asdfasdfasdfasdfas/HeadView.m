
//
//  AAAAA.m
//  asdfasdfasdfasdfas
//
//  Created by ZNM_YuBin on 15/8/25.
//  Copyright (c) 2015年 YuBin. All rights reserved.
//

#import "HeadView.h"

@interface HeadView ()<UIScrollViewDelegate>

@property (nonatomic,strong)UIImageView * iconView;
@property (nonatomic,strong)UIActivityIndicatorView * indicator;

@end

@implementation HeadView

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.frame = frame;
        self.backgroundColor = [UIColor clearColor];
        CGFloat leftWeight = 15;
        UILabel * labelLine = [[UILabel alloc] initWithFrame:CGRectMake(leftWeight, 50, [UIScreen mainScreen].bounds.size.width - leftWeight, 0.5)];
        [self addSubview:labelLine];
        labelLine.backgroundColor = [UIColor colorWithWhite:0.8 alpha:1];
//
        
        UIImage * icon = [UIImage imageNamed:@"top"];
        self.iconView = [[UIImageView alloc] initWithFrame:CGRectMake(([UIScreen mainScreen].bounds.size.width - 15)/2, 10, 15, 40)];
        [self addSubview:self.iconView];
        self.iconView.image = icon;
        
        self.indicator = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width/2 - 25, 0, 50, 50)];
        [self addSubview:self.indicator];
        self.indicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;
        
        
    }
    return self;
}

-(void)UpdateHeadViewWithState:(NSInteger)state
{
    if (state == headViewStateLastBeforeLoging)
    {
        self.iconView.hidden = NO;
        self.indicator.hidden = YES;
        self.iconView.transform=CGAffineTransformMakeRotation(0);

    }
    else if (state == headViewStateLastStartLoging)
    {
        self.iconView.hidden = NO;
        self.indicator.hidden = YES;
        self.iconView.transform=CGAffineTransformMakeRotation(M_PI);
    }
    else if (state == headViewStateLastLoging)
    {
        self.iconView.hidden = YES;
        self.indicator.hidden = NO;
        [self.indicator startAnimating];
    }
    else if (state == headViewStateLastAfterLoging)
    {
        self.iconView.hidden = YES;
        [self.indicator stopAnimating];
        self.indicator.hidden = YES;

    }

}



@end
