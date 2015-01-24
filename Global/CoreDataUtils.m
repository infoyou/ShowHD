//
//  CoreDataUtils.m
//  iAlumniHD
//
//  Created by Adam on 12-11-9.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import "CoreDataUtils.h"

#define MAX_SAVED_RECORD_COUNT      50

@implementation CoreDataUtils

#pragma mark - common utility methods
+ (NSManagedObject *)fetchObjectFromMOC:(NSManagedObjectContext *)MOC
                             entityName:(NSString *)entityName
                              predicate:(NSPredicate *)predicate {
    
	NSFetchRequest *fetchRequest1 = [[[NSFetchRequest alloc] init] autorelease];
    fetchRequest1.entity = [NSEntityDescription entityForName:entityName
                                       inManagedObjectContext:MOC];
    if (predicate) {
        fetchRequest1.predicate = predicate;
    }
    fetchRequest1.fetchLimit = 1;
    fetchRequest1.includesPropertyValues = NO;
	
	NSError *error = nil;
	NSArray *objects = [MOC executeFetchRequest:fetchRequest1
                                          error:&error] ;
    if (nil == objects || 0 == [objects count]) {
        return nil;
    } else {
        return [objects lastObject];
    }
}

+ (NSArray *)loadObjectsFromMOC:(NSManagedObjectContext *)MOC
                     entityName:(NSString *)entityName
                      predicate:(NSPredicate *)predicate
         includesPropertyValues:(BOOL)includesPropertyValues {
    
    NSFetchRequest *fetchRequest = [[[NSFetchRequest alloc] init] autorelease];
    fetchRequest.entity = [NSEntityDescription entityForName:entityName
                                      inManagedObjectContext:MOC];
    if (predicate) {
        fetchRequest.predicate = predicate;
    }
    
    fetchRequest.includesPropertyValues = includesPropertyValues;
	
	NSError *error = nil;
	NSArray *objects = [MOC executeFetchRequest:fetchRequest
                                          error:&error] ;
    return objects;
    
}

+ (NSArray *)fetchObjectsFromMOC:(NSManagedObjectContext *)MOC
                      entityName:(NSString *)entityName
                       predicate:(NSPredicate *)predicate {
    
	return [self loadObjectsFromMOC:MOC entityName:entityName predicate:predicate includesPropertyValues:YES];
}

+ (NSInteger)objectCountsFromMOC:(NSManagedObjectContext *)MOC
                      entityName:(NSString *)entityName
                       predicate:(NSPredicate *)predicate {
    return [self loadObjectsFromMOC:MOC entityName:entityName predicate:predicate includesPropertyValues:NO].count;
}

+ (NSArray *)fetchObjectsFromMOC:(NSManagedObjectContext *)MOC
                      entityName:(NSString *)entityName
                       predicate:(NSPredicate *)predicate
                       sortDescs:(NSMutableArray *)sortDescs
                   limitedNumber:(NSInteger)limitedNumber {
    
    NSFetchRequest *fetchRequest = [[[NSFetchRequest alloc] init] autorelease];
    fetchRequest.entity = [NSEntityDescription entityForName:entityName
                                      inManagedObjectContext:MOC];
    if (predicate) {
        fetchRequest.predicate = predicate;
    }
    
    if (limitedNumber > 0) {
        fetchRequest.fetchLimit = limitedNumber;
    }
    
    if (sortDescs && sortDescs.count > 0) {
        fetchRequest.sortDescriptors = sortDescs;
    }
	
	NSError *error = nil;
	NSArray *objects = [MOC executeFetchRequest:fetchRequest
                                          error:&error] ;
    return objects;
}

+ (NSArray *)fetchObjectsFromMOC:(NSManagedObjectContext *)MOC
                      entityName:(NSString *)entityName
                       predicate:(NSPredicate *)predicate
                       sortDescs:(NSMutableArray *)sortDescs {
    
    return [self fetchObjectsFromMOC:MOC
                          entityName:entityName
                           predicate:predicate
                           sortDescs:sortDescs
                       limitedNumber:-1];
}

+ (BOOL)objectInMOC:(NSManagedObjectContext *)MOC
         entityName:(NSString *)entityName
          predicate:(NSPredicate *)predicate {
    
    if ([self fetchObjectFromMOC:MOC entityName:entityName predicate:predicate] != nil) {
        return YES;
    } else {
        return NO;
    }
}

+ (BOOL)saveMOCChange:(NSManagedObjectContext *)MOC {
    if ([MOC hasChanges]) {
        NSError *error;
        if (![MOC save:&error]) {
            NSLog(@"MOC save with error: %@", [error localizedDescription]);
            return NO;
        }
    }
    
    return YES;
}

+ (NSFetchedResultsController *)fetchObject:(NSManagedObjectContext *)aManagedObjectContext
                   fetchedResultsController:(NSFetchedResultsController *)aFetchedResultsController
                                 entityName:(NSString *)entityName
                         sectionNameKeyPath:(NSString *)sectionNameKeyPath
                            sortDescriptors:(NSMutableArray *)sortDescriptors
                                  predicate:(NSPredicate *)aPredicate {
    
    NSFetchedResultsController *result = nil;
    
    if (aFetchedResultsController == nil) {
		// set entity
		NSFetchRequest *fetchRequest = [[[NSFetchRequest alloc] init] autorelease];
		[fetchRequest setEntity:[NSEntityDescription entityForName:entityName
                                            inManagedObjectContext:aManagedObjectContext]];
		
		// set predicate
		if (aPredicate != nil) {
			[fetchRequest setPredicate:aPredicate];
		}
		
        if (sortDescriptors) {
            [fetchRequest setSortDescriptors:sortDescriptors];
        }
        
		NSString *cacheName = [[NSString alloc] initWithFormat:@"%@Cache", entityName];
        result = [[[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest
                                                      managedObjectContext:aManagedObjectContext
                                                        sectionNameKeyPath:sectionNameKeyPath
                                                                 cacheName:cacheName] autorelease];
        
        [cacheName release];
		cacheName = nil;
		
	} else {
		result = aFetchedResultsController;
	}
	return result;
}

+ (BOOL)deleteEntitiesFromMOC:(NSManagedObjectContext *)MOC
                   entityName:(NSString *)entityName
                    predicate:(NSPredicate *)predicate {
    
    @autoreleasepool {
        
        NSFetchRequest * fetch = [[[NSFetchRequest alloc] init] autorelease];
        if (predicate) {
            fetch.predicate = predicate;
        }
        fetch.entity = [NSEntityDescription entityForName:entityName inManagedObjectContext:MOC];
        fetch.includesPropertyValues = NO;
        NSError *error = nil;
        NSArray *result = [MOC executeFetchRequest:fetch error:&error];
        if ([result count] ==  0) {
            return YES;
        }
        
        if (nil == error) {
            for (id object in result) {
                [MOC deleteObject:object];
            }
            
            if (![MOC save:&error]) {
                NSLog(@"Delete all %@ failed: %@", entityName, [error domain]);
                return NO;
            } else {
                return YES;
            }
        } else {
            NSLog(@"Delete all %@ failed: %@", entityName, [error domain]);
            return NO;
        }
    }
}

+ (BOOL)deleteEntitiesFromMOC:(NSManagedObjectContext *)MOC
                     entities:(NSArray *)entities {
    
    @autoreleasepool {
        
        if (nil == MOC) {
            return NO;
        }
        
        if ([entities count] ==  0) {
            return YES;
        }
        
        NSError *error = nil;
        for (id object in entities) {
            [MOC deleteObject:object];
        }
        
        if (![MOC save:&error]) {
            NSLog(@"Delete failed: %@", [error domain]);
            return NO;
        } else {
            return YES;
        }
    }
}

@end
