//
//  PERPersistentDataManager.m
//  PersonaObjcCode
//
//  Created by Persona on 2020/1/2.
//  Copyright © 2020 ZhouShisong. All rights reserved.
//

#import "PERPersistentDataManager.h"
#import "NSData+Cipher.h"

#define kUserInfo   @"kUserInfodjaskiew"
#define kUserToken  @"kUserTokendahkjhe"

#define kUserKey [[NSData alloc] initWithBytes:((uint8_t[]){0x3b,0x97,0x77,0x66,0x44,0x52,0xe1,0x4a,0x77,0xa8,0xad,0xf6,0x32,0x4d,0xe7,0x22}) length:16]

#define kTokenKey [[NSData alloc] initWithBytes:((uint8_t[]){0x7e,0x77,0x64,0x3c,0xa7,0xd4,0x6d,0x46,0x29,0x8b,0xe3,0x23,0x9f,0x1a,0x5c,0xdb}) length:16]

@implementation PERPersistentDataManager{
    PERUserModel *_userCache;
}

+ (instancetype)sharedManager {
    static PERPersistentDataManager *_sharedManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedManager = [[self.class alloc] init];
    });
    
    return _sharedManager;
}

- (void)storeUser:(PERUserModel *)user {
    NSError *error = nil;
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:user requiringSecureCoding:YES error:&error];
    data = [data AES128EncryptWithKey:kUserKey];
    if (data) {
        [[NSUserDefaults standardUserDefaults] setObject:data forKey:kUserInfo];
        [[NSUserDefaults standardUserDefaults] synchronize];
        _userCache = user;
    }
}

- (PERUserModel *)user {
    if (_userCache) {
        return _userCache;
    }
    
    NSData *data = [[NSUserDefaults standardUserDefaults] objectForKey:kUserInfo];
    data = [data AES128DecryptWithKey:kUserKey];
    if (!data) {
        return nil;
    }
    
    _userCache = [NSKeyedUnarchiver unarchivedObjectOfClass:PERUserModel.class fromData:data error:nil];
    return _userCache;
}

- (void)storeToken:(NSString *)token {
    NSData *data = [token dataUsingEncoding:NSUTF8StringEncoding];
    data = [data AES128EncryptWithKey:kTokenKey];
    if (data) {
        [[NSUserDefaults standardUserDefaults] setObject:data forKey:kUserToken];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
}

- (NSString *)token {
    NSData *data = [[NSUserDefaults standardUserDefaults] objectForKey:kUserToken];
    data = [data AES128DecryptWithKey:kTokenKey];
    if (!data) {
        return nil;
    }
    return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
}

- (void)storeTest:(NSArray *)array {
    NSError *error = nil;
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:array.copy requiringSecureCoding:NO error:&error];
    if (data) {
        [[NSUserDefaults standardUserDefaults] setObject:data forKey:@"1234567890"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
}

- (NSArray *)test {
    NSData *data = [[NSUserDefaults standardUserDefaults] objectForKey:@"1234567890"];
    if (!data) {
        return nil;
    }
    
    NSError *error = nil;
    NSArray *array = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    return array;
}

- (void)cleanSession {
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:kUserInfo];
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:kUserToken];
    [[NSUserDefaults standardUserDefaults] synchronize];
    _userCache = nil;
}

@end
