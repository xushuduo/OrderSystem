//
//  UIFactory.h
//
//  Copyright © 2016年 XuShuduo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIFactory : NSObject

+ (UILabel *)labelWithText:(NSString *)text
                 textColor:(UIColor *)textColor
                  fontSize:(CGFloat)fontSize
                   addView:(UIView *)view;

+ (UIButton *)buttonWithTitle:(NSString *)title
                   titleColor:(UIColor *)titleColor
                titleFontSize:(CGFloat)titleFontSize
                       target:(id)target
                     selector:(SEL)selector
                      addView:(UIView *)view;

+ (UIButton *)buttonWithImage:(UIImage *)normalImage
                       target:(id)target
                     selector:(SEL)selector
                      addView:(UIView *)view;

+ (UIButton *)buttonSubmitWithTarget:(id)target
                            selector:(SEL)selector
                             addView:(UIView *)view
                               Title:(NSString *)title;

+ (UITextField *)textFieldWithFontSize:(CGFloat)fontSize
                             textColor:(UIColor *)textColor
                           Placeholder:(NSString *)placeholder
                      PlaceholderColor:(UIColor *)placeholderColor
                         returnKeyType:(UIReturnKeyType)returnKeyType
                               addView:(UIView *)view;

+ (UIView *)lineViewAddView:(UIView *)view;

+ (UIImageView *)imageViewWithImageName:(NSString *)imageName addView:(UIView *)view;

@end

@interface NotHighlightedButton : UIButton

@end
