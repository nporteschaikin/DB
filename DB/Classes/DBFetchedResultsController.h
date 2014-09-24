//
//  DBFetchedResultsController.h
//  DB
//
//  Created by Noah Portes Chaikin on 9/23/14.
//  Copyright (c) 2014 Noah Portes Chaikin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DBObject.h"

@class DBFetchedResultsSection;
@class DBFetchedResultsController;

@protocol DBFetchedResultsControllerDelegate

- (void)controllerWillChangeContent:(DBFetchedResultsController *)controller;
- (void)controllerDidChangeContent:(DBFetchedResultsController *)controller;

@end

@interface DBFetchedResultsController : NSObject

@property (strong, nonatomic) id<DBFetchedResultsControllerDelegate> delegate;
@property (strong, nonatomic, readonly) NSMutableArray *sections;
@property (strong, nonatomic, readonly) NSMutableArray *objects;

- (id)initWithObjectFetcher:(DBObjectFetcher *)anObjectFetcher
         sectionNameKeyPath:(NSString *)aSectionNameKeyPath;
- (DBObject *)objectAtIndexPath:(NSIndexPath *)indexPath;

@end


@interface DBFetchedResultsSection : NSObject

@property (nonatomic, readonly) NSString *title;
@property (nonatomic, readonly) NSUInteger numberOfObjects;
@property (nonatomic, readonly) NSArray *objects;

@end