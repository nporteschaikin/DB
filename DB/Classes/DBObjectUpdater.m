//
//  DBObjectUpdater.m
//  DB
//
//  Created by Noah Portes Chaikin on 9/23/14.
//  Copyright (c) 2014 Noah Portes Chaikin. All rights reserved.
//

#import "DBObjectUpdater.h"
#import "DBDatabase.h"

@interface DBObjectUpdater () {
    DBObject * DBObjectInstance;
}

@end

@implementation DBObjectUpdater

- (id)initWithDBObject:(DBObject *)DBObject {
    if (self = [super init]) {
        DBObjectInstance = DBObject;
    }
    return self;
}

- (BOOL)execute {
    if ([DBObjectInstance.changedColumns count]) {
        NSString *sqlQuery = [self sqlQuery];
        if ([[DBDatabase sharedDatabase] executeUpdate:sqlQuery]) {
            return YES;
        }
    }
    return NO;
}

- (NSString *)sqlQuery {
    NSString *tableName = [[DBObjectInstance class] tableName];
    DBColumn *primaryKeyColumn = [[DBObjectInstance class] primaryKeyColumn];
    NSNumber *primaryKeyValue = [DBObjectInstance valueForColumn:primaryKeyColumn];
    NSMutableArray *sqlArguments = [NSMutableArray array];
    
    for (DBColumn *column in DBObjectInstance.changedColumns) {
        [sqlArguments addObject:[NSString stringWithFormat:@"%@ = \"%@\"",
                                 column.name, [DBObjectInstance valueForColumn:column]]];
    }
    
    return [NSString stringWithFormat:@"UPDATE %@ SET %@ WHERE %@ = %@",
            tableName, [sqlArguments componentsJoinedByString:@", "], primaryKeyColumn.name, primaryKeyValue];
}

@end
