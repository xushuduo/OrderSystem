//
//  UIFactory.m
//
//  Copyright © 2016年 XuShuduo. All rights reserved.
//

#import "UIFactory.h"

@implementation UIFactory

+ (UILabel *)labelWithText:(NSString *)text textColor:(UIColor *)textColor fontSize:(CGFloat)fontSize addView:(UIView *)view {
    UILabel *label = [UILabel new];
    label.text = text;
    label.textColor = textColor;
    label.font = [UIFont systemFontOfSize:fontSize];
    if (view) {
        [view addSubview:label];
    }
    return label;
}

+ (UIButton *)buttonWithTitle:(NSString *)title titleColor:(UIColor *)titleColor titleFontSize:(CGFloat)titleFontSize target:(id)target selector:(SEL)selector addView:(UIView *)view {
    UIButton *button = [UIButton buttonWithType:0];
    [button setTitle:title forState:UIControlStateNormal];
    [button.titleLabel setFont:[UIFont systemFontOfSize:titleFontSize]];
    [button setTitleColor:titleColor forState:UIControlStateNormal];
    [button addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    [button sizeToFit];
    if (view) {
        [view addSubview:button];
    }
    return button;
}

+ (UIButton *)buttonWithImage:(UIImage *)normalImage target:(id)target selector:(SEL)selector addView:(UIView *)view {
    UIButton *button = [UIButton buttonWithType:0];
    [button setImage:normalImage forState:UIControlStateNormal];
    [button addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    [button sizeToFit];
    if (view) {
        [view addSubview:button];
    }
    return button;
}

+ (UIButton *)buttonSubmitWithTarget:(id)target selector:(SEL)selector addView:(UIView *)view Title:(NSString *)title {
    UIButton *button = [self buttonWithTitle:title titleColor:[UIColor whiteColor] titleFontSize:17 target:target selector:selector addView:view];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button setTitleColor:UIColorFromRGBString(0xDDDDDD) forState:UIControlStateDisabled];
    [button setBackgroundImage:[UIImage imageNamed:@"defaultButtonStateNormal"] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:@"defaultButtonStateHighlighted"] forState:UIControlStateHighlighted];
    [button setBackgroundImage:[UIImage imageNamed:@"defaultButtonStateDisabled"] forState:UIControlStateDisabled];
    button.layer.cornerRadius = 4;
    button.layer.masksToBounds = YES;
    return button;
}

+ (UITextField *)textFieldWithFontSize:(CGFloat)fontSize textColor:(UIColor *)textColor Placeholder:(NSString *)placeholder PlaceholderColor:(UIColor *)placeholderColor returnKeyType:(UIReturnKeyType)returnKeyType addView:(UIView *)view {
    UITextField *textField = [[UITextField alloc] init];
    if (placeholderColor) {
        [textField setValue:placeholderColor forKeyPath:@"_placeholderLabel.textColor"];
    }
    textField.returnKeyType = returnKeyType;
    [textField setPlaceholder:placeholder];
    [textField setFont:[UIFont systemFontOfSize:fontSize]];
    [textField setTextColor:textColor];
    textField.clearButtonMode = UITextFieldViewModeWhileEditing;
    if (view) {
        [view addSubview:textField];
    }
    return textField;
}

+ (UIView *)lineViewAddView:(UIView *)view {
    UIView *lineView = [UIView new];
    lineView.backgroundColor = kLineColor;
    if (view) {
        [view addSubview:lineView];
    }
    return lineView;
}

+ (UIImageView *)imageViewWithImageName:(NSString *)imageName addView:(UIView *)view {
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageName]];
    if (view) {
        [view addSubview:imageView];
    }
    return imageView;
}

@end

@implementation NotHighlightedButton

- (void)setHighlighted:(BOOL)highlighted {}

@end
