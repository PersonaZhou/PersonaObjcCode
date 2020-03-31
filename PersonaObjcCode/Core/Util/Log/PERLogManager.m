//
//  PERLogManager.m
//  PersonaObjcCode
//
//  Created by Persona on 2020/1/6.
//  Copyright © 2020 ZhouShisong. All rights reserved.
//

#import "PERLogManager.h"
#import "PERLogger.h"
#import "PERTTYLogger.h"

static PERLogManager *_perLog = nil;

@implementation PERLogManager {
    NSMutableArray *_loggers;
}

+ (PERLogManager *)sharedInstance {
    if (_perLog == nil) {
        _perLog = [[PERLogManager alloc] init];
    }
    return _perLog;
}

- (void)addLogger:(id<PERLogger>)logger {
    if (!logger) return;
    
    if (!_loggers) {
        _loggers = [[NSMutableArray alloc] init];
    }
    
    [_loggers addObject:logger];
}

- (void)removeLoger:(id<PERLogger>)logger {
    [_loggers removeObject:logger];
}


- (void)writeWithType:(NSInteger)type atLevel:(NSInteger)level file:(const char *)file function:(const char *)function line:(NSUInteger)line format:(NSString *)format,... {
    va_list args;
    va_start(args, format);
    NSString *log = [[NSString alloc] initWithFormat:format arguments:args];
    va_end(args);
    
    for (id<PERLogger> logger in _loggers) {
        if (level >= logger.logAtLevel) {
            dispatch_async(logger.loggerQueue, ^{
                [logger writeLog:log withType:type atLevel:level file:file function:function line:line];
                NSLog(@"log: %@", log);
            });
        }
    }
}

@end
