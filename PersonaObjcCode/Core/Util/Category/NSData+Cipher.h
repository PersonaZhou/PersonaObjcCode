//
//  NSData+Cipher.h
//  PersonaObjcCode
//
//  Created by Persona on 2020/1/2.
//  Copyright © 2020 ZhouShisong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonCrypto.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSData (Cipher)

- (NSData *)AES128EncryptWithKey:(NSData *)key;

- (NSData *)AES128DecryptWithKey:(NSData *)key;

@end

NS_ASSUME_NONNULL_END
