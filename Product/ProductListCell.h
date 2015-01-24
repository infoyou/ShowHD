//
//  ProductListCell.h
//  JITShowHD
//
//  Created by Adam on 13-3-27.
//  Copyright (c) 2013年 Adam. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Product;

@interface ProductListCell : UITableViewCell
{
    UILabel *productName;
    UIImageView *starView;
    UIImageView *hotView;
    UILabel *productPrice;
    UILabel *productManufacturer;
    UILabel *productSpec;
}

- (void)drawProduct:(Product *)product;

@end
