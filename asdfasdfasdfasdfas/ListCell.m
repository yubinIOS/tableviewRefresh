//
//  ListCell.m
//  asdfasdfasdfasdfas
//
//  Created by ZNM_YuBin on 15/8/24.
//  Copyright (c) 2015年 YuBin. All rights reserved.
//

#import "ListCell.h"

@interface ListCell ()

@property (nonatomic,strong)UILabel * labelTitle;

@property (nonatomic,strong)UIActivityIndicatorView * viewShow;

@end

@implementation ListCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.labelTitle = [[UILabel alloc] initWithFrame:CGRectMake(20, 0, self.frame.size.width-40, 45)];
        [self addSubview:self.labelTitle];
        
        self.viewShow = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
        [self addSubview:self.viewShow];
        self.viewShow.frame = CGRectMake(100, 0, 30, 30);
        
        
        
    }
    return self;
}

-(void)reloadCellData:(NSDictionary *)dict
{
    NSString * str = dict[cellTitle];
    
    self.labelTitle.text = str;
}

@end
