//
//  DBFetchedResultsController.m
//  DB
//
//  Created by Noah Portes Chaikin on 9/23/14.
//  Copyright (c) 2014 Noah Portes Chaikin. All rights reserved.
//

#import "DBFetchedResultsController.h"

// ================== DBFetchedResultsSection ==================

@interface DBFetchedResultsSection ()

@property (nonatomic, readwrite) id value;
@property (nonatomic, readwrite) NSUInteger numberOfObjects;
@property (nonatomic, readwrite) NSArray *objects;

@end

@implementation DBFetchedResultsSection
@end


// ================== DBFetchedResultsController ==================

@interface DBFetchedResultsController () {
    DBObjectFetcher *objectFetcher;
    NSString *sectionNameKeyPath;
}

@property (strong, nonatomic, readwrite) NSMutableArray *sections;
@end

@implementation DBFetchedResultsController

- (id)initWithObjectFetcher:(DBObjectFetcher *)anObjectFetcher
         sectionNameKeyPath:(NSString *)aSectionNameKeyPath {
    if (self = [super init]) {
        objectFetcher = anObjectFetcher;
        sectionNameKeyPath = aSectionNameKeyPath;
        
        [self performFetch];
    }
    return self;
}

- (void)performFetch {
    NSMutableArray *sections = [NSMutableArray array];
    NSArray *objects = [objectFetcher fetch];
    
    for (DBObject *object in objects) {
        id sectionNameKeyPathValue = [object valueForKeyPath:sectionNameKeyPath];
        DBFetchedResultsSection *section = [[sections filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"%K = %@",
                                                                                   @"value", sectionNameKeyPathValue]] firstObject];
        NSMutableArray *sectionObjects = [section.objects mutableCopy];
        
        if (!section) {
            section = [[DBFetchedResultsSection alloc] init];
            sectionObjects = [NSMutableArray array];
            section.value = sectionNameKeyPathValue;
            
            [sections addObject:section];
        }

        [sectionObjects addObject:object];
        
        section.objects = sectionObjects;
        section.numberOfObjects = sectionObjects.count;
    }
    
    self.sections = sections;
}

- (DBObject *)objectAtIndexPath:(NSIndexPath *)indexPath {
    DBFetchedResultsSection *section = [self.sections objectAtIndex:indexPath.section];
    return [section.objects objectAtIndex:indexPath.row];
}

@end
