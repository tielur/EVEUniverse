//
//  NCDBEveIconImage.h
//  NCDatabase
//
//  Created by Артем Шиманский on 17.09.14.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class NCDBEveIcon;

@interface NCDBEveIconImage : NSManagedObject

@property (nonatomic, retain) id image;
@property (nonatomic, retain) NCDBEveIcon *icon;

@end
