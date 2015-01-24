//
//  ProductListCell.m
//  JITShowHD
//
//  Created by Adam on 13-3-27.
//  Copyright (c) 2013年 Adam. All rights reserved.
//

#import "ProductListCell.h"
#import "Product.h"
#import "GlobalConstants.h"

@interface ProductListCell ()

@end

@implementation ProductListCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
        productName = [[UILabel alloc] initWithFrame:CGRectMake(23, 15, 221, 21)];
        productName.textColor = COLOR(130, 133, 130);
        productName.font = BOLD_FONT(16);
        productName.backgroundColor = ClearColor;
        [self.contentView addSubview:productName];
        
        starView = [[UIImageView alloc] initWithFrame:CGRectMake(23, 50, 75, 14)];
        starView.image = [UIImage imageNamed:@"star.png"];
        [self.contentView addSubview:starView];
        
        hotView = [[UIImageView alloc] initWithFrame:CGRectMake(252, 0, 20, 21)];
        hotView.image = [UIImage imageNamed:@"hot.png"];
        [self.contentView addSubview:hotView];
        
        productPrice = [[UILabel alloc] initWithFrame:CGRectMake(180, 45, 100, 21)];
        productPrice.textColor = COLOR(149, 154, 142);
        productPrice.font = FONT(18);
        productPrice.backgroundColor = ClearColor;
        [self.contentView addSubview:productPrice];
        
        productSpec = [[UILabel alloc] initWithFrame:CGRectMake(23, 85, 90, 21)];
        productSpec.textColor = COLOR(0, 158, 216);
        productSpec.font = FONT(14);
        productSpec.backgroundColor = ClearColor;
        [self.contentView addSubview:productSpec];
        
        productManufacturer = [[UILabel alloc] initWithFrame:CGRectMake(120, 85, 160, 21)];
        productManufacturer.textColor = COLOR(78, 208, 52);
        productManufacturer.font = FONT_KaiShu(16);
        productManufacturer.backgroundColor = ClearColor;
        [self.contentView addSubview:productManufacturer];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)drawProduct:(Product *)product
{
    productName.text = product.name;
    
    productManufacturer.text = product.manufacturer;
    productPrice.text = product.price;
    productSpec.text = product.spec;
    
    if (product.isHot.boolValue) {
        hotView.hidden = NO;
    } else {
        hotView.hidden = YES;
    }
    
    if([product.productId longLongValue]%2 == 0) {
        self.contentView.backgroundColor = COLOR(206, 243, 189);
    } else {
        self.contentView.backgroundColor = COLOR(243, 243, 243);
    }
}

@end
