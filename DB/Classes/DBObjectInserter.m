//
//  DBObjectInserter.m
//  DB
//
//  Created by Noah Portes Chaikin on 9/23/14.
//  Copyright (c) 2014 Noah Portes Chaikin. All rights reserved.
//

#import "DBObjectInserter.h"
#import "DBDatabase.h"

@interface DBObjectInserter () {
    DBObject *DBObjectInstance;
}

@end

@implementation DBObjectInserter

- (id)initWithDBObject:(DBObject *)DBObject {
    if (self = [super init]) {
        DBObjectInstance = DBObject;
    }
    return self;
}

- (NSNumber *)execute {
    NSString *sqlQuery = [self sqlQuery];
    if ([[DBDatabase sharedDatabase] executeQuery:sqlQuery]) {
        return [[DBDatabase sharedDatabase] lastInsertPrimaryKey];
    }
    return nil;
}

- (NSString *)sqlQuery {
    NSSet *columns = DBObjectInstance.changedColumns;
    
    if (columns) {
        NSMutableArray *columnsSql = [NSMutableArray array];
        NSMutableArray *valuesSql = [NSMutableArray array];
        NSString *tableName = [[DBObjectInstance class] tableName];
        
        for (DBColumn *column in columns) {
            [columnsSql addObject:column.name];
            [valuesSql addObject:[NSString stringWithFormat:@"\"%@\"", [DBObjectInstance valueForColumn:column]]];
        }
        
        return [NSString stringWithFormat:@"INSERT INTO %@ (%@) VALUES (%@);",
                tableName, [columnsSql componentsJoinedByString:@","], [valuesSql componentsJoinedByString:@","]];
        
    }
    return nil;
}

@end
