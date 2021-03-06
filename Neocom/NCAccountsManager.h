//
//  NCAccountsManager.h
//  Neocom
//
//  Created by Artem Shimanski on 18.12.13.
//  Copyright (c) 2013 Artem Shimanski. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NCAccount.h"
#import "NCAPIKey.h"

@class NCStorage;
@interface NCAccountsManager : NSObject
@property (nonatomic, strong, readonly) NSArray* accounts;
@property (nonatomic, strong, readonly) NSArray* apiKeys;
@property (nonatomic, strong, readonly) NCStorage* storage;
+ (instancetype) sharedManager;
+ (void) setSharedManager:(NCAccountsManager*) manager;

- (id) initWithStorage:(NCStorage*) storage;
- (BOOL) addAPIKeyWithKeyID:(int32_t) keyID vCode:(NSString*) vCode error:(NSError**) errorPtr;
- (void) removeAccount:(NCAccount*) account;
- (void) reload;
@end
