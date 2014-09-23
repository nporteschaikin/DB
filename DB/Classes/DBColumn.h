//
//  DBColumn.h
//  DB
//
//  Created by Noah Portes Chaikin on 9/23/14.
//  Copyright (c) 2014 Noah Portes Chaikin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSString+DBUppercaseFirst.h"

@interface DBColumn : NSObject

@property (nonatomic, readonly) Class DBObjectClass;
@property (strong, nonatomic, readonly) NSString *name;
@property (nonatomic, readonly) char *key;
@property (strong, nonatomic, readonly) NSString *type;
@property (nonatomic, readonly) BOOL isPrimaryKey;
@property (nonatomic, readonly) SEL getterSelector;
@property (nonatomic, readonly) SEL setterSelector;

- (id)initWithDBObjectClass:(Class)DBObjectClass
                   withName:(NSString *)name
                   withType:(NSString *)type
               isPrimaryKey:(BOOL)isPrimaryKey;

@end

