//
//  XSDTagModel.h
//  OrderSystem
//
//  Created by 许树铎 on 2017/9/17.
//  Copyright © 2017年 XSDCoder. All rights reserved.
//

#import <Foundation/Foundation.h>

/** 文字大小 */
static const NSInteger kTagTextFontSize = 13;

// 标签文本左(右)空隙
static const CGFloat tagLabelLeftMargin = 10;

// 标签按钮左(右)间的间隙
static const CGFloat tagButtonLeftMargin = 15;

// 标签按钮上(下)间的间隙
static const CGFloat tagButtonTopMargin = 10;

// 标签按钮高度
static const CGFloat tagButtonHeight = 25;

/** 默认背景颜色 */
#define kNormalBackgroundColor [UIColor whiteColor]

/** 选中背景颜色 */
#define kSelectedBackgroundColor UIColorFromRGBString(0xD4F0FF)

/** 默认文本颜色 */
#define kNormalFontColor UIColorFromRGBString(0x333333)

/** 选中文本颜色 */
#define kSelectedFontColor UIColorFromRGBString(0x333333)

/** 默认边框颜色 */
#define kNormalBorderColor kNormalFontColor

/** 选中边框颜色 */
#define kSelectedBorderColor kSelectedBackgroundColor

@interface XSDTagModel : NSObject

@property (nonatomic, strong) NSString *tagName;

@property (nonatomic, assign) CGFloat tagWidth;

@property (nonatomic, strong) NSString *ID;

@property (nonatomic, assign) BOOL selected;

@property (nonatomic, assign) CGRect buttonFrame;

@end
