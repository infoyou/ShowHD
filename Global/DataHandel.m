//
//  DataHandel.m
//  JITShowHD
//
//  Created by Adam on 13-3-28.
//  Copyright (c) 2013年 Adam. All rights reserved.
//

#import "DataHandel.h"
#import "GlobalConstants.h"
#import "Product.h"
#import "AppManager.h"

@implementation DataHandel

+ (NSArray *)objectsInMOC:(NSManagedObjectContext *)MOC
               entityName:(NSString *)entityName
             sortDescKeys:(NSArray *)sortDescKeys
                predicate:(NSPredicate *)predicate {
    
	NSFetchRequest *fetchRequest1 = [[[NSFetchRequest alloc] init] autorelease];
	[fetchRequest1 setEntity:[NSEntityDescription entityForName:entityName
                                         inManagedObjectContext:MOC]];
	[fetchRequest1 setPredicate:predicate];
    [fetchRequest1 setSortDescriptors:sortDescKeys];
    //	[fetchRequest1 setFetchLimit:1];
	
	NSError *error = nil;
	NSArray *objects = [MOC executeFetchRequest:fetchRequest1
                                          error:&error] ;
	return objects;
}

+ (NSManagedObject *)hasSameObjectAlready:(NSManagedObjectContext *)MOC
                               entityName:(NSString *)entityName
                             sortDescKeys:(NSArray *)sortDescKeys
                                predicate:(NSPredicate *)predicate {
	
	NSArray *objects = [self objectsInMOC:MOC entityName:entityName sortDescKeys:sortDescKeys predicate:predicate];
	
	if ([objects count] == 0) {
		return nil;
	}
	
	return (NSManagedObject *)objects[0];
}

+ (void)saveGanMao {
    NSArray *nameArray = [[NSArray alloc] initWithObjects:@"感冒灵颗粒", @"板蓝根颗粒", @"复方氨酚烷胺胶囊", @"银翘解毒片", @"布洛芬缓释胶囊", @"双黄连口服液", nil];
    
    NSArray *manufacturerArray = [[NSArray alloc] initWithObjects:@"999牌", @"白云山", @"仁和可立克", @"同仁堂", @"芬必得", @"三精", nil];
    
    NSArray *specArray = [[NSArray alloc] initWithObjects:@"10g*9包", @"10g*20包", @"10粒", @"0.55g*40片", @"0.3*20粒", @"10ml*10支", nil];
    
    NSArray *priceArray = [[NSArray alloc] initWithObjects:@"￥9.5", @"￥10.5", @"￥6.5", @"￥6.5", @"￥13.5", @"￥12.9", nil];
    
    int size = [nameArray count];
    for (int i=0; i<size; i++) {
        
        Product *product = (Product *)[NSEntityDescription insertNewObjectForEntityForName:@"Product" inManagedObjectContext:[AppManager instance].MOC];
        
        product.productId = @(i);
        product.name = nameArray[i];
        product.manufacturer = manufacturerArray[i];
        product.spec = specArray[i];
        product.price = priceArray[i];
        product.type = @(11);
        
        if (i%2==0) {
            product.isHot = @(YES);
        } else {
            product.isHot = @(NO);
        }
        product.rate = @(i);
    }

    SAVE_MOC([AppManager instance].MOC);
}

+ (void)saveEJiao {
    NSArray *nameArray = [[NSArray alloc] initWithObjects:@"阿胶", @"复方阿胶浆", @"阿胶补血颗粒", @"阿胶补血膏", nil];
    
    NSArray *manufacturerArray = [[NSArray alloc] initWithObjects:@"东阿阿胶", @"东阿阿胶", @"东阿阿胶", @"东阿阿胶", nil];
    
    NSArray *specArray = [[NSArray alloc] initWithObjects:@"500g", @"20ml*12支", @"4g*30袋", @"300g*4瓶", nil];
    
    NSArray *priceArray = [[NSArray alloc] initWithObjects:@"￥609", @"￥33", @"￥49", @"￥128", nil];
    
    int size = [nameArray count];
    for (int i=0; i<size; i++) {
        
        Product *product = (Product *)[NSEntityDescription insertNewObjectForEntityForName:@"Product" inManagedObjectContext:[AppManager instance].MOC];
        
        product.productId = @(i);
        product.name = nameArray[i];
        product.manufacturer = manufacturerArray[i];
        product.spec = specArray[i];
        product.price = priceArray[i];
        product.type = @(12);
        
        if (i%2==0) {
            product.isHot = @(YES);
        } else {
            product.isHot = @(NO);
        }
        product.rate = @(i);
    }
    
    SAVE_MOC([AppManager instance].MOC);
}

+ (void)saveProduct {
    
    [self saveGanMao];
    [self saveEJiao];
}

@end
