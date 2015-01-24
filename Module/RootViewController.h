//
//  RootViewController.h
//  JITShowHD
//
//  Created by Adam on 13-3-26.
//  Copyright (c) 2013年 Adam. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GlobalConstants.h"
#import <QuartzCore/QuartzCore.h>
#import "AppManager.h"
#import "CoreDataUtils.h"

@interface RootViewController : UIViewController

@property (nonatomic, retain) NSFetchedResultsController *fetchedRC;
@property (nonatomic, copy) NSString *entityName;
@property (nonatomic, retain) NSMutableArray *descriptors;
@property (nonatomic, retain) NSPredicate *predicate;

#pragma mark - add Tap ActionView
- (void)addTapActionView:(UIView*)view;

#pragma mark - click Img View
- (void)clickImgView:(id)sender;

#pragma mark - core data
- (void)setFetchCondition;
- (NSFetchedResultsController *)prepareFetchRC;

@end
