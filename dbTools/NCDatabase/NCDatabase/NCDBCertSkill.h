//
//  NCDBCertSkill.h
//  NCDatabase
//
//  Created by Артем Шиманский on 17.09.14.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class NCDBCertMastery, NCDBInvType;

@interface NCDBCertSkill : NSManagedObject

@property (nonatomic) int16_t skillLevel;
@property (nonatomic, retain) NCDBCertMastery *mastery;
@property (nonatomic, retain) NCDBInvType *type;

@end
