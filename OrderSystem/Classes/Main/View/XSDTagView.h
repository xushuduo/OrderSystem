//
//  XSDTagView.h
//  OrderSystem
//
//  Created by 许树铎 on 2017/9/17.
//  Copyright © 2017年 XSDCoder. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XSDTagModel.h"

@class XSDTagView;

@protocol XSDTagViewDelegate <NSObject>

- (void)tagView:(XSDTagView *)tagView tagButtonActionWithModel:(XSDTagModel *)tagModel;

@end

@interface XSDTagView : UIView

- (instancetype)initWithDataArray:(NSArray<XSDTagModel *> *)dataArray;

@property (nonatomic, copy) NSArray<XSDTagModel *> *dataArray;

@property (nonatomic, weak) id <XSDTagViewDelegate> delegate;

+ (CGFloat)getHeightWithDataArray:(NSArray<XSDTagModel *> *)dataArray tagViewWidth:(CGFloat)width;

@end
