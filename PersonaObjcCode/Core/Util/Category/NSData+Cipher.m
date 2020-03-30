//
//  NSData+Cipher.m
//  PersonaObjcCode
//
//  Created by Persona on 2020/1/2.
//  Copyright © 2020 ZhouShisong. All rights reserved.
//

#import "NSData+Cipher.h"

@implementation NSData (Cipher)

CCOptions NSDataCommonCryptoCryptDefaultOptions = kCCOptionPKCS7Padding;

static NSData * NSDataCommonCryptoCrypt(CCOperation operation, NSData *data, NSData *key, CCAlgorithm algorithm, CCOptions options, size_t keyLength, size_t blockSize) {
    unsigned char keyBytes[keyLength];
    
    NSInteger diff = keyLength - key.length;
    if (diff <= 0) {
        memcpy(keyBytes, key.bytes, keyLength);
    } else {
        bzero(keyBytes + key.length, diff);
        memcpy(keyBytes, key.bytes, key.length);
    }
    
    size_t bufSize = data.length + blockSize;
    void *buf = malloc(bufSize);
    
    size_t outSize = 0;
    
    CCCryptorStatus status = CCCrypt(operation, algorithm, options, keyBytes, keyLength, NULL,
                                     data.bytes, data.length, buf, bufSize, &outSize);
    
    if (status != kCCSuccess) {
        free(buf);
        return nil;
    }
    
    return [NSData dataWithBytesNoCopy:buf length:outSize freeWhenDone:YES];
}

- (NSData *) AES128EncryptWithKey:(NSData *)key {
    return NSDataCommonCryptoCrypt(kCCEncrypt, self, key, kCCAlgorithmAES128, NSDataCommonCryptoCryptDefaultOptions, kCCKeySizeAES128, kCCBlockSizeAES128);
}

- (NSData *) AES128DecryptWithKey:(NSData *)key {
    return NSDataCommonCryptoCrypt(kCCDecrypt, self, key, kCCAlgorithmAES128, NSDataCommonCryptoCryptDefaultOptions, kCCKeySizeAES128, kCCBlockSizeAES128);
}

@end
