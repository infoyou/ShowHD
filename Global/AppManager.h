//
//  AppManager.h
//  JITShowHD
//
//  Created by Adam on 13-3-28.
//  Copyright (c) 2013年 Adam. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AppManager : NSObject

@property (nonatomic, retain) NSManagedObjectContext *MOC;
@property (nonatomic, assign) int productDetailType;

#pragma mark - instance
+ (AppManager *)instance;

@end
