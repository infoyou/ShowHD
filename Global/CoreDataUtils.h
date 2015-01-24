//
//  CoreDataUtils.h
//  iAlumniHD
//
//  Created by Adam on 12-11-9.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "GlobalConstants.h"

@interface CoreDataUtils : NSObject {
  
}

#pragma mark - common utility methods
+ (NSManagedObject *)fetchObjectFromMOC:(NSManagedObjectContext *)MOC 
                             entityName:(NSString *)entityName 
                              predicate:(NSPredicate *)predicate;

+ (NSArray *)fetchObjectsFromMOC:(NSManagedObjectContext *)MOC 
                      entityName:(NSString *)entityName 
                       predicate:(NSPredicate *)predicate 
                       sortDescs:(NSMutableArray *)sortDescs
                   limitedNumber:(NSInteger)limitedNumber;

+ (NSArray *)fetchObjectsFromMOC:(NSManagedObjectContext *)MOC 
                      entityName:(NSString *)entityName 
                       predicate:(NSPredicate *)predicate 
                       sortDescs:(NSMutableArray *)sortDescs;

+ (NSArray *)fetchObjectsFromMOC:(NSManagedObjectContext *)MOC 
                      entityName:(NSString *)entityName 
                       predicate:(NSPredicate *)predicate;

+ (NSInteger)objectCountsFromMOC:(NSManagedObjectContext *)MOC 
                      entityName:(NSString *)entityName 
                       predicate:(NSPredicate *)predicate;

+ (BOOL)objectInMOC:(NSManagedObjectContext *)MOC 
         entityName:(NSString *)entityName 
          predicate:(NSPredicate *)predicate;

+ (BOOL)saveMOCChange:(NSManagedObjectContext *)MOC;

+ (NSFetchedResultsController *)fetchObject:(NSManagedObjectContext *)aManagedObjectContext 
                   fetchedResultsController:(NSFetchedResultsController *)aFetchedResultsController
                                 entityName:(NSString *)entityName 
                         sectionNameKeyPath:(NSString *)sectionNameKeyPath 
                            sortDescriptors:(NSMutableArray *)sortDescriptors
                                  predicate:(NSPredicate *)aPredicate;

+ (BOOL)deleteEntitiesFromMOC:(NSManagedObjectContext *)MOC
                   entityName:(NSString *)entityName 
                    predicate:(NSPredicate *)predicate;

+ (BOOL)deleteEntitiesFromMOC:(NSManagedObjectContext *)MOC
                     entities:(NSArray *)entities;

@end
