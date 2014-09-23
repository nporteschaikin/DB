//
//  DBColumnFetcher.m
//  DB
//
//  Created by Noah Portes Chaikin on 9/23/14.
//  Copyright (c) 2014 Noah Portes Chaikin. All rights reserved.
//

#import "DBColumnFetcher.h"
#import "DBColumn.h"
#import "DBDatabase.h"
#import "DBObject.h"
#import "DBObjectAccessorHelper.h"

@interface DBColumnFetcher () {
    Class DBObjectClass;
}

@end

@implementation DBColumnFetcher

- (id)initWithDBObjectClass:(Class)aDBObjectClass {
    if (self = [super init]) {
        DBObjectClass = aDBObjectClass;
    }
    return self;
}

- (NSMutableSet *)fetch {
    NSMutableSet *columns = [NSMutableSet set];
    NSString *sqlQuery = [NSString stringWithFormat:@"PRAGMA table_info(%@)", [DBObjectClass performSelector:@selector(tableName)]];
    
    NSArray *sqlColumns = [[DBDatabase sharedDatabase] executeQuery:sqlQuery];
    for (NSDictionary *sqlColumn in sqlColumns) {
        DBColumn *column = [[DBColumn alloc] initWithDBObjectClass:DBObjectClass
                                                          withName:sqlColumn[@"name"]
                                                          withType:sqlColumn[@"type"]
                                                      isPrimaryKey:[sqlColumn[@"pk"] boolValue]];
        [columns addObject:column];
        
    }
    return columns;
}

@end