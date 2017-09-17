//
//  XSDTagModel.m
//  OrderSystem
//
//  Created by 许树铎 on 2017/9/17.
//  Copyright © 2017年 XSDCoder. All rights reserved.
//

#import "XSDTagModel.h"

@implementation XSDTagModel

- (CGFloat)tagWidth {
    if (_tagWidth == 0 && self.tagName) {
        _tagWidth = [self.tagName boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:kTagTextFontSize]} context:nil].size.width + 2 * tagLabelLeftMargin;
    }
    return _tagWidth;
}

@end
