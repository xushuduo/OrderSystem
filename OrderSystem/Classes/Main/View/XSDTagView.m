//
//  XSDTagView.m
//  OrderSystem
//
//  Created by 许树铎 on 2017/9/17.
//  Copyright © 2017年 XSDCoder. All rights reserved.
//

#import "XSDTagView.h"
#import "UIImage+Color.h"

@implementation XSDTagView

- (instancetype)initWithDataArray:(NSArray<XSDTagModel *> *)dataArray {
    self = [super init];
    if (self) {
        self.dataArray = dataArray;
    }
    return self;
}

- (void)setDataArray:(NSArray<XSDTagModel *> *)dataArray {
    _dataArray = dataArray;
    for (UIView *subView in self.subviews) {
        [subView removeFromSuperview];
    }
    UIImage *normalBackgroundImage = [UIImage imageWithColor:kNormalBackgroundColor];
    UIImage *selectedBackgroundImage = [UIImage imageWithColor:kSelectedBackgroundColor];
    for (int i = 0; i < dataArray.count; i++) {
        XSDTagModel *model = dataArray[i];
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setTitle:model.tagName forState:UIControlStateNormal];
        [button.titleLabel setFont:[UIFont systemFontOfSize:kTagTextFontSize]];
        [button setBackgroundImage:normalBackgroundImage forState:UIControlStateNormal];
        [button setBackgroundImage:selectedBackgroundImage forState:UIControlStateSelected];
        [button setTitleColor:kNormalFontColor forState:UIControlStateNormal];
        [button setTitleColor:kSelectedFontColor forState:UIControlStateSelected];
        button.selected = model.selected;
//        button.layer.borderColor = model.selected ? kSelectedBorderColor.CGColor : kNormalBorderColor.CGColor;
        button.layer.borderWidth = 0.5f;
        button.layer.cornerRadius = 5.0f;
        button.layer.masksToBounds = YES;
        button.tag = 56526 + i;
        [button addTarget:self action:@selector(tagButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button];
    }
}

- (void)layoutSubviews {
    [super layoutSubviews];
    if (self.subviews.count != self.dataArray.count) return;
//    [XSDTagView getHeightWithDataArray:self.dataArray tagViewWidth:self.width];
    for (int i = 0; i < self.subviews.count; i++) {
        self.subviews[i].frame = self.dataArray[i].buttonFrame;
    }
}

- (void)tagButtonAction:(UIButton *)button {
    button.selected = !button.selected;
    XSDTagModel *model = self.dataArray[button.tag - 56526];
    model.selected = button.selected;
//    button.layer.borderColor = model.selected ? kSelectedBorderColor.CGColor : kNormalBorderColor.CGColor;
    if ([self.delegate respondsToSelector:@selector(tagView:tagButtonActionWithModel:)]) {
        [self.delegate tagView:self tagButtonActionWithModel:model];
    }
}

+ (CGFloat)getHeightWithDataArray:(NSArray<XSDTagModel *> *)dataArray tagViewWidth:(CGFloat)width {
    for (int i = 0; i < dataArray.count; i++) {
        XSDTagModel *model = dataArray[i];
        CGFloat tagBtnX = 0;
        CGFloat tagBtnY = 0;
        if (i > 0) {
            tagBtnX = CGRectGetMaxX(dataArray[i - 1].buttonFrame) + tagButtonLeftMargin;
            tagBtnY = dataArray[i - 1].buttonFrame.origin.y;
            if (width - tagBtnX - tagButtonLeftMargin < model.tagWidth) {
                tagBtnX = 0;
                tagBtnY += tagButtonHeight + tagButtonTopMargin;
            }
        }
        model.buttonFrame = CGRectMake(tagBtnX, tagBtnY, model.tagWidth, tagButtonHeight);
    }
    return CGRectGetMaxY(dataArray.lastObject.buttonFrame);
}

@end
