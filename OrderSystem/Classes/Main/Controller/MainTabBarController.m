//
//  MainTabBarController.m
//  OrderSystem
//
//  Created by 许树铎 on 2017/9/17.
//  Copyright © 2017年 XSDCoder. All rights reserved.
//

#import "MainTabBarController.h"
#import "MainNavigationController.h"
#import "HomeViewController.h"
#import "OrderViewController.h"
#import "FormsViewController.h"
#import "SettingViewController.h"
#import "UIImage+Render.h"

@interface MainTabBarController ()

@end

@implementation MainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupChildViewController];
}

- (void)setupChildViewController {
    [self addChildViewController:[HomeViewController new] normalImageName:@"" selectedImageName:@"" title:@"首页"];
    [self addChildViewController:[OrderViewController new] normalImageName:@"" selectedImageName:@"" title:@"订单"];
    [self addChildViewController:[FormsViewController new] normalImageName:@"" selectedImageName:@"" title:@"报表"];
    [self addChildViewController:[SettingViewController new] normalImageName:@"" selectedImageName:@"" title:@"设置"];
}

- (void)addChildViewController:(UIViewController *)childController normalImageName:(NSString *)normalImageName selectedImageName:(NSString *)selectedImageName title:(NSString *)title {
    childController.title = title;
    [childController.tabBarItem setImage:[UIImage imageNameWithOriginal:normalImageName]];
    [childController.tabBarItem setSelectedImage:[UIImage imageNameWithOriginal:selectedImageName]];
    MainNavigationController *nav = [[MainNavigationController alloc] initWithRootViewController:childController];
    [self addChildViewController:nav];
}

@end
