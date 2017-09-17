//
//  AppConstant.h
//  OrderSystem
//
//  Created by 许树铎 on 2017/9/17.
//  Copyright © 2017年 XSDCoder. All rights reserved.
//

#ifndef AppConstant_h
#define AppConstant_h

/** 屏幕 */
#define keyWindow [[[UIApplication sharedApplication] delegate] window]
#define kScreenHeight [[UIScreen mainScreen] bounds].size.height
#define kScreenWidth [[UIScreen mainScreen] bounds].size.width

/** 导航栏高度 */
static const CGFloat kNavgationBarHeight = 44.0f;
/** 状态栏高度 */
static const CGFloat kStatusBarHeight = 20.0f;
/** 状态导航栏高度 */
static const CGFloat kNavgationStatusHeight = 64.0f;
/** TabBar高度 */
static const CGFloat kTabBarHeight = 49.0f;

/** 颜色 */
#define UIColorFromRGBString(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#define UIColorFromRGBA(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
#define UIColorFromRGB(r,g,b) UIColorFromRGBA(r,g,b,1.0)
/** 通用文本颜色333 */
#define kDefault333Color UIColorFromRGBString(0x333333)
/** 通用文本颜色666 */
#define kDefault666Color UIColorFromRGBString(0x666666)
/** 通用文本颜色999 */
#define kDefault999Color UIColorFromRGBString(0x999999)
/** 占位颜色CCC */
#define kPlaceHolderColor UIColorFromRGBString(0xCCCCCC)
/** 背景颜色F5F5F9 */
#define kBackgroundColor UIColorFromRGBString(0xF5F5F9)
/** 线颜色E6E6E6 */
#define kLineColor UIColorFromRGBString(0xE6E6E6)
/** 主题颜色00A0FA */
#define kThemeColor UIColorFromRGBString(0x00A0FA)

/** 弱引用 */
#define WeakSelf(weakSelf) __weak __typeof(&*self)weakSelf = self;

/** NSLog */
#ifdef DEBUG
#define NSLog(FORMAT, ...) NSLog((@"%s [Line %d] " FORMAT), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#define NSLog(...)
#endif

/** Alert */
#define Alert(MESSAGE) [[[UIAlertView alloc] initWithTitle:@"提示" message:MESSAGE delegate:nil cancelButtonTitle:@"确认" otherButtonTitles:nil] show]

#endif /* AppConstant_h */
