//
//  PERLogManager.h
//  PersonaObjcCode
//
//  Created by Persona on 2020/1/6.
//  Copyright © 2020 ZhouShisong. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol PERLogger;

#define kLogTypeDefault 0

typedef enum {
    kLogLevelVerbose    = 64,
    kLogLevelDebug      = kLogLevelVerbose << 1,
    kLogLevelInfo       = kLogLevelVerbose << 2,
    kLogLevelWarning    = kLogLevelVerbose << 3,
    kLogLevelError      = kLogLevelVerbose << 4,
    kLogLevelPanic      = kLogLevelVerbose << 5
} kTraceLevel;

@interface PERLogManager : NSObject

+ (PERLogManager *)sharedInstance;

- (void)addLogger:(id<PERLogger>)logger;
- (void)removeLoger:(id<PERLogger>)logger;

- (void)writeWithType:(NSInteger)type atLevel:(NSInteger)level file:(const char *)file function:(const char *)function line:(NSUInteger)line format:(NSString*)format,...;

@end

NS_ASSUME_NONNULL_END
