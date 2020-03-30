//
//  PERTTYLogger.m
//  PersonaObjcCode
//
//  Created by Persona on 2020/1/6.
//  Copyright © 2020 ZhouShisong. All rights reserved.
//

#import "PERTTYLogger.h"

@implementation PERTTYLogger {
    NSDateFormatter *_dateFormatter;
}
@synthesize logAtLevel;
@synthesize loggerQueue;

+ (void)load {

}

- (id)init {
    if (self = [super init]) {
        _dateFormatter = [[NSDateFormatter alloc] init];
        [_dateFormatter setTimeZone:[NSTimeZone localTimeZone]];
        [_dateFormatter setDateFormat:@"HH:mm:ss SSS"];
    }
    return self;
}

- (dispatch_queue_t)loggerQueue {
    return dispatch_get_main_queue();
}

- (void)writeLog:(NSString *)log withType:(NSInteger)type atLevel:(NSInteger)level file:(const char *)file function:(const char *)function line:(NSUInteger)line {
    NSString *date = [_dateFormatter stringFromDate:[NSDate date]];
    printf("[%s] [%ld] [%ld] %s %s %lu %s\n",
           date.UTF8String,
           (long)type,
           (long)level,
           [[NSString stringWithUTF8String:file] lastPathComponent].UTF8String,
           function,
           (unsigned long)line,
           log.UTF8String);
}

@end
