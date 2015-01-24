//
//  AppDelegate.h
//  JITShowHD
//
//  Created by Adam on 13-3-22.
//  Copyright (c) 2013年 Adam. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomePageViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
