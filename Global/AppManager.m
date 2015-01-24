//
//  AppManager.m
//  JITShowHD
//
//  Created by Adam on 13-3-28.
//  Copyright (c) 2013年 Adam. All rights reserved.
//

#import "AppManager.h"
#import "CoreDataUtils.h"

@implementation AppManager
@synthesize MOC;
@synthesize productDetailType;

#pragma mark - instance
static AppManager *shareInstance = nil;

+ (AppManager *)instance {
    @synchronized(self) {
        if (nil == shareInstance) {
            shareInstance = [[self alloc] init];
        }
    }
    
    return shareInstance;
}

+ (id)allocWithZone:(NSZone *)zone {
    @synchronized(self) {
        if (nil == shareInstance) {
            shareInstance = [super allocWithZone:zone];
            return shareInstance;
        }
    }
    return nil;
}

- (id)copyWithZone:(NSZone *)zone {
    return self;
}

- (id)retain {
    return self;
}

- (oneway void)release {
}

- (unsigned)retainCount {
    return UINT_MAX;
}

- (id)autorelease {
    return self;
}

- (void)dealloc {
    [super dealloc];
}


@end
