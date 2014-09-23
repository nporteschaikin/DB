//
//  DBDatabase.h
//  DB
//
//  Created by Noah Portes Chaikin on 9/23/14.
//  Copyright (c) 2014 Noah Portes Chaikin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DBDatabase : NSObject

+ (DBDatabase *)sharedDatabase;

- (id)initWithFileName:(NSString *)filename;
- (BOOL)executeUpdate:(NSString *)query;
- (NSArray *)executeQuery:(NSString *)query;
- (NSNumber *)lastInsertPrimaryKey;

@end
