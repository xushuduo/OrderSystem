//
//  GoodsTableViewCell.h
//  OrderSystem
//
//  Created by 许树铎 on 2017/9/17.
//  Copyright © 2017年 XSDCoder. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XSDTagView.h"

@interface GoodsTableViewCell : UITableViewCell

@property (nonatomic, copy) NSArray<XSDTagModel *> *tagArray;

@end
