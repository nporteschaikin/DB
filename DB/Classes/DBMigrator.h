//
//  DBMigrator.h
//  DB
//
//  Created by Noah Portes Chaikin on 9/23/14.
//  Copyright (c) 2014 Noah Portes Chaikin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DBDatabase.h"
#import "DBMigration.h"

@interface DBMigrator : NSObject

- (id)initWithDatabase:(DBDatabase *)database;
- (void)insertMigration:(DBMigration *)migration
              atVersion:(int)version;
- (void)migrate;

@end
