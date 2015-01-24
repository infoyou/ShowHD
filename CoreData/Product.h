//
//  Product.h
//  JITShowHD
//
//  Created by Adam on 13-4-12.
//  Copyright (c) 2013年 Adam. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Product : NSManagedObject

@property (nonatomic, retain) NSNumber * isHot;
@property (nonatomic, retain) NSString * manufacturer;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * price;
@property (nonatomic, retain) NSNumber * productId;
@property (nonatomic, retain) NSNumber * rate;
@property (nonatomic, retain) NSString * spec;
@property (nonatomic, retain) NSNumber * type;

@end
