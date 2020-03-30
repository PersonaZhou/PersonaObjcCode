//
//  PERLog.h
//  PersonaObjcCode
//
//  Created by Persona on 2020/1/6.
//  Copyright © 2020 ZhouShisong. All rights reserved.
//

#ifndef PERLog_h
#define PERLog_h

#import "PERLogManager.h"

#define PERLog PERLogD

#define PERLogD(fmt, ...) PERLogTD(kLogTypeDefault, fmt, ##__VA_ARGS__)
#define PERLogW(fmt, ...) PERLogTD(kLogTypeDefault, fmt, ##__VA_ARGS__)
#define PERLogE(fmt, ...) PERLogTD(kLogTypeDefault, fmt, ##__VA_ARGS__)
#define PERLogP(fmt, ...) PERLogTD(kLogTypeDefault, fmt, ##__VA_ARGS__)

#define PERLogTD(type, fmt, ...) PERLogV((type), kLogLevelDebug, fmt, ##__VA_ARGS__)
#define PERLogTW(type, fmt, ...) PERLogV((type), kLogLevelWarning, fmt, ##__VA_ARGS__)
#define PERLogTE(type, fmt, ...) PERLogV((type), kLogLevelError, fmt, ##__VA_ARGS__)
#define PERLogTP(type, fmt, ...) ERLogV((type), kLogLevelPanic, fmt, ##__VA_ARGS__)

#define PERLogV(type, level, fmt, ...)                                  \
[[PERLogManager sharedInstance] writeWithType:type                  \
atLevel:level                 \
file:__FILE__              \
function:__PRETTY_FUNCTION__   \
line:__LINE__              \
format:fmt, ##__VA_ARGS__];

#endif /* PERLog_h */
