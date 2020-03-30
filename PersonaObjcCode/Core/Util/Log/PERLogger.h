//
//  PERLogger.h
//  PersonaObjcCode
//
//  Created by Persona on 2020/1/6.
//  Copyright © 2020 ZhouShisong. All rights reserved.
//

#ifndef PERLogger_h
#define PERLogger_h

@protocol PERLogger <NSObject>

@property (nonatomic, assign) NSInteger logAtLevel;
@property (nonatomic, strong, readonly) dispatch_queue_t loggerQueue;

- (void)writeLog:(NSString *)log withType:(NSInteger)type atLevel:(NSInteger)level file:(const char *)file function:(const char *)function line:(NSUInteger)line;

@end

#endif /* PERLogger_h */
