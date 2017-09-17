//
//  GoodsTableViewCell.m
//  OrderSystem
//
//  Created by 许树铎 on 2017/9/17.
//  Copyright © 2017年 XSDCoder. All rights reserved.
//

#import "GoodsTableViewCell.h"

@interface GoodsTableViewCell ()

@property (nonatomic, weak) XSDTagView *tagView;

@end

@implementation GoodsTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupView];
    }
    return self;
}

- (void)setupView {
    UILabel *foodNameLabel = [UIFactory labelWithText:@"肠粉" textColor:kDefault666Color fontSize:14 addView:self.contentView];
    
    UILabel *priceLabel = [UIFactory labelWithText:@"￥12.00" textColor:kDefault666Color fontSize:15 addView:self.contentView];
    
    XSDTagView *tagView = [[XSDTagView alloc] init];
    tagView.userInteractionEnabled = NO;
    tagView.width = kScreenWidth * 0.3 - 30;
    [self.contentView addSubview:tagView];
    self.tagView = tagView;
    
    [foodNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(10);
        make.left.offset(15);
    }];
    [priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(foodNameLabel);
        make.right.offset(-15);
    }];
    [tagView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(foodNameLabel.mas_bottom).offset(8);
        make.left.offset(15);
        make.width.offset(tagView.width);
        make.height.offset(0);
    }];
}

- (void)setTagArray:(NSArray<XSDTagModel *> *)tagArray {
    _tagArray = tagArray;
    self.tagView.dataArray = tagArray;
    [self.tagView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.offset([XSDTagView getHeightWithDataArray:self.tagArray tagViewWidth:self.tagView.width]);
    }];
}

@end
