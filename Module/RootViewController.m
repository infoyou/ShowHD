//
//  RootViewController.m
//  JITShowHD
//
//  Created by Adam on 13-3-26.
//  Copyright (c) 2013年 Adam. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController
@synthesize fetchedRC;
@synthesize entityName;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return UIInterfaceOrientationIsLandscape(interfaceOrientation);
}

#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_6_0
- (NSUInteger)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskLandscape;
}

- (BOOL)shouldAutorotate {
    return YES;
}
#endif

#pragma mark - add Tap ActionView
- (void)addTapActionView:(UIView*)view {
    
    UITapGestureRecognizer *tap = [[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickImgView:)] autorelease];
    
    [view addGestureRecognizer:tap];
}

#pragma mark - click Img View
- (void)clickImgView:(id)sender {}

#pragma mark - core data
- (void)setFetchCondition {
    // implemented by subclass
}

- (NSFetchedResultsController *)prepareFetchRC {
    
    [self setFetchCondition];
    self.fetchedRC = nil;
    
    self.fetchedRC = [CoreDataUtils fetchObject:[AppManager instance].MOC
                     fetchedResultsController:self.fetchedRC
                                   entityName:self.entityName
                           sectionNameKeyPath:nil
                              sortDescriptors:self.descriptors
                                    predicate:self.predicate];
    return self.fetchedRC;
}

@end
