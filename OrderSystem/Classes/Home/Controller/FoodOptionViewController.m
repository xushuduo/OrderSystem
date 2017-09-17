//
//  FoodOptionViewController.m
//  OrderSystem
//
//  Created by 许树铎 on 2017/9/17.
//  Copyright © 2017年 XSDCoder. All rights reserved.
//

#import "FoodOptionViewController.h"

@interface FoodOptionViewController () <UITableViewDataSource, UITableViewDelegate>

@end

@implementation FoodOptionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupView];
}

- (void)setupView {
    UITableView *tableView = [UITableView new];
    tableView.backgroundColor = kBackgroundColor;
    tableView.dataSource = self;
    tableView.delegate = self;
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass([UITableViewCell class])];
    [self.view addSubview:tableView];
    
    UIButton *cancelButton = [UIFactory buttonWithTitle:@"取消" titleColor:kDefault666Color titleFontSize:20 target:self selector:@selector(cancelButtonAction) addView:self.view];
    cancelButton.backgroundColor = [UIColor whiteColor];
    
    UIButton *submitButton = [UIFactory buttonWithTitle:@"确定" titleColor:[UIColor whiteColor] titleFontSize:20 target:self selector:@selector(submitButtonAction) addView:self.view];
    submitButton.backgroundColor = kThemeColor;
    
    [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.offset(0);
        make.bottom.mas_equalTo(cancelButton.mas_top);
    }];
    [cancelButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.left.offset(0);
        make.height.offset(60);
    }];
    [submitButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.width.height.mas_equalTo(cancelButton);
        make.right.offset(0);
        make.left.mas_equalTo(cancelButton.mas_right);
    }];
}

- (void)cancelButtonAction {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)submitButtonAction {
    
    [self cancelButtonAction];
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 5;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class])];
    cell.textLabel.text = [NSString stringWithFormat:@"%zd--%zd", indexPath.section, indexPath.row];
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return [NSString stringWithFormat:@"第%zd个", section];
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 40;
}

@end
