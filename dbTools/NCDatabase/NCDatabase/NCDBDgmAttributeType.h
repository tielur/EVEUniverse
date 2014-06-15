//
//  NCDBDgmAttributeType.h
//  NCDatabase
//
//  Created by Shimanski Artem on 15.06.14.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class NCDBDgmAttributeCategory, NCDBDgmTypeAttribute, NCDBEveIcon, NCDBEveUnit;

@interface NCDBDgmAttributeType : NSManagedObject

@property (nonatomic) int32_t attributeID;
@property (nonatomic, retain) NSString * attributeName;
@property (nonatomic, retain) NSString * displayName;
@property (nonatomic) BOOL published;
@property (nonatomic, retain) NCDBDgmAttributeCategory *attributeCategory;
@property (nonatomic, retain) NCDBEveIcon *icon;
@property (nonatomic, retain) NSSet *typeAttributes;
@property (nonatomic, retain) NCDBEveUnit *unit;
@end

@interface NCDBDgmAttributeType (CoreDataGeneratedAccessors)

- (void)addTypeAttributesObject:(NCDBDgmTypeAttribute *)value;
- (void)removeTypeAttributesObject:(NCDBDgmTypeAttribute *)value;
- (void)addTypeAttributes:(NSSet *)values;
- (void)removeTypeAttributes:(NSSet *)values;

@end
