//
//  FoodCollectionViewCell.m
//  OrderSystem
//
//  Created by 许树铎 on 2017/9/17.
//  Copyright © 2017年 XSDCoder. All rights reserved.
//

#import "FoodCollectionViewCell.h"

@implementation FoodCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupView];
    }
    return self;
}

- (void)setupView {
    self.contentView.backgroundColor = [UIColor whiteColor];
    self.layer.shadowOffset = CGSizeMake(0, 1);
    self.layer.shadowColor = [UIColor colorWithWhite:0 alpha:0.5].CGColor;
    self.layer.shadowOpacity = 0.5;
    self.layer.shadowRadius = 1;
    self.contentView.layer.cornerRadius = 5;
    self.contentView.layer.masksToBounds = YES;
    
    UIButton *titleButton = [UIFactory buttonWithTitle:@"肠粉" titleColor:kDefault333Color titleFontSize:15 target:nil selector:nil addView:self.contentView];
    titleButton.enabled = NO;
    self.titleButton = titleButton;
    
    [titleButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.offset(0);
    }];
}

@end
