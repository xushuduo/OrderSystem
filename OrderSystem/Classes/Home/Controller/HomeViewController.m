//
//  HomeViewController.m
//  OrderSystem
//
//  Created by 许树铎 on 2017/9/17.
//  Copyright © 2017年 XSDCoder. All rights reserved.
//

#import "HomeViewController.h"
#import "FoodCollectionViewCell.h"
#import "GoodsTableViewCell.h"
#import "FoodOptionViewController.h"
#import "SettlingViewController.h"

@interface HomeViewController () <UICollectionViewDataSource, UICollectionViewDelegate, UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, weak) UICollectionView *collectionView;

@property (nonatomic, weak) UITableView *tableView;

@property (nonatomic, copy) NSArray<XSDTagModel *> *tagArray;

@end

@implementation HomeViewController

- (NSArray<XSDTagModel *> *)tagArray {
    if (!_tagArray) {
        _tagArray = [NSArray yy_modelArrayWithClass:[XSDTagModel class] json:@"[{\"tagName\":\"加蛋\"},{\"tagName\":\"加面\"},{\"tagName\":\"加肉\"},{\"tagName\":\"加汁加汁加汁\"},{\"tagName\":\"加蛋加蛋\"},{\"tagName\":\"加蛋加蛋加蛋加蛋加蛋加蛋\"},{\"tagName\":\"加蛋加蛋加蛋\"}]"];
    }
    return _tagArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupView];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
}

- (void)setupView {
    [self.navigationController setNavigationBarHidden:YES];
    
    CGFloat margin = 15;
    CGFloat rowCount = 5;
    CGFloat cellWidthHeight = (self.view.width * 0.7 - (margin + margin * rowCount)) / rowCount;
    UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
    layout.sectionInset = UIEdgeInsetsMake(0, margin, margin, margin);
    layout.itemSize = CGSizeMake(cellWidthHeight, cellWidthHeight);
    layout.minimumLineSpacing = margin;
    layout.minimumInteritemSpacing = margin;
    
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
    collectionView.dataSource = self;
    collectionView.delegate = self;
    collectionView.backgroundColor = kBackgroundColor;
    collectionView.contentInset = UIEdgeInsetsMake(20, 0, 0, 0);
    [collectionView registerClass:[FoodCollectionViewCell class] forCellWithReuseIdentifier:NSStringFromClass([FoodCollectionViewCell class])];
    [self.view addSubview:collectionView];
    self.collectionView = collectionView;
    
    UITableView *tableView = [UITableView new];
    tableView.backgroundColor = kBackgroundColor;
    tableView.dataSource = self;
    tableView.delegate = self;
    tableView.separatorColor = kLineColor;
    tableView.separatorInset = UIEdgeInsetsMake(0, 15, 0, 15);
    [tableView registerClass:[GoodsTableViewCell class] forCellReuseIdentifier:NSStringFromClass([GoodsTableViewCell class])];
    [self.view addSubview:tableView];
    self.tableView = tableView;
    
    UIView *toolView = [UIView new];
    [self.view addSubview:toolView];
    
    UILabel *sumTitleLabel = [UIFactory labelWithText:@"总计：" textColor:kDefault666Color fontSize:15 addView:toolView];
    UILabel *sumValueLabel = [UIFactory labelWithText:@"￥20.00" textColor:UIColorFromRGBString(0xFF366B) fontSize:18 addView:toolView];
    
    UIButton *submitButton = [UIFactory buttonWithTitle:@"结算" titleColor:[UIColor whiteColor] titleFontSize:20 target:self selector:@selector(submitButtonAction:) addView:toolView];
    submitButton.backgroundColor = kThemeColor;
    
    UIToolbar *statusBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, self.view.width, kStatusBarHeight)];
    [self.view addSubview:statusBar];
    
    UIView *line1 = [UIFactory lineViewAddView:statusBar];
    UIView *line2 = [UIFactory lineViewAddView:self.view];
    UIView *line3 = [UIFactory lineViewAddView:self.view];
    UIView *line4 = [UIFactory lineViewAddView:toolView];
    
    // Layout
    [line1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.offset(0);
        make.height.offset(0.5);
    }];
    [line2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(collectionView.mas_right);
        make.top.mas_equalTo(statusBar.mas_bottom);
        make.bottom.offset(0);
        make.width.offset(0.5);
    }];
    [line3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(tableView.mas_bottom);
        make.left.width.mas_equalTo(tableView);
        make.height.offset(0.5);
    }];
    [collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.bottom.offset(0);
        make.width.mas_equalTo(self.view).multipliedBy(0.7);
    }];
    [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(statusBar.mas_bottom);
        make.left.mas_equalTo(line2.mas_right);
        make.right.offset(0);
    }];
    [toolView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(tableView.mas_bottom);
        make.bottom.offset(-kTabBarHeight);
        make.left.right.mas_equalTo(tableView);
        make.height.offset(120);
    }];
    [sumTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(sumValueLabel);
        make.left.offset(15);
    }];
    [sumValueLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(10);
        make.right.offset(-15);
    }];
    [line4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(40);
        make.left.right.offset(0);
        make.height.offset(0.5);
    }];
    [submitButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(line4.mas_bottom);
        make.left.right.bottom.offset(0);
    }];
}

- (void)submitButtonAction:(UIButton *)button {
    SettlingViewController *vc = [SettlingViewController new];
    vc.modalPresentationStyle = UIModalPresentationFormSheet;
    [self presentViewController:vc animated:YES completion:nil];
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 50;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    FoodCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([FoodCollectionViewCell class]) forIndexPath:indexPath];
    
    return cell;
}

#pragma mark - UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    GoodsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([GoodsTableViewCell class])];
    cell.tagArray = self.tagArray;
    return cell;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    FoodOptionViewController *vc = [FoodOptionViewController new];
    vc.modalPresentationStyle = UIModalPresentationFormSheet;
    [self presentViewController:vc animated:YES completion:nil];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 45 + CGRectGetMaxY(self.tagArray.lastObject.buttonFrame);
}

@end
