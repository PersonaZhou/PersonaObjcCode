//
//  PERMacro.h
//  PersonaObjcCode
//
//  Created by Persona on 2019/12/30.
//  Copyright © 2019 ZhouShisong. All rights reserved.
//

#ifndef PERMacro_h
#define PERMacro_h

typedef NS_OPTIONS(NSInteger, PERErrorCode) {
    PERErrorCodeUnknown = 0,
    PERErrorCodeAuthenticationFailed = 1,
    PERErrorCodeOther = 2,
    PERErrorIllegalInput = 3, //参数错误
};

#define DIC_SAFE_SET_OBJECT(dic, obj, key)  \
do {                                    \
if (obj) {                          \
[dic setObject:obj forKey:key]; \
}                                   \
} while(false)

#define UIColorFromRGBA(rgbValue, a) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:a]
#define UIColorFromRGB(rgbValue) UIColorFromRGBA(rgbValue, 1.0)

#define RGB_COLOR(a, b, c) [UIColor colorWithRed:a/255.0 green:b/255.0 blue:c/255.0 alpha:1]

#define k_is_iPhoneX \
({BOOL isPhoneX = NO;\
if (@available(iOS 11.0, *)) {\
isPhoneX = [[UIApplication sharedApplication] delegate].window.safeAreaInsets.bottom > 0.0;\
}\
(isPhoneX);})

#define kStatusHeight (k_is_iPhoneX ? 44.0 : 20.0)
#define kNaviHeight 44.0
#define kStatusNaviHeight (k_is_iPhoneX ? 88.0 : 64.0)
#define kTabbarHeight (k_is_iPhoneX ? 83.0 : 49.0)

#define kScreenWidth [[UIScreen mainScreen] bounds].size.width

#ifdef DEBUG
#define PERAssert(condition) assert(condition)
#else
#define PERAssert(condition) do{}while(0)
#endif

#define PERVerifyParam(condition, fmt, ...) \
do { \
if (!(condition)) { \
NSMutableDictionary* dic = nil;\
if ((fmt)) { \
dic = [[NSMutableDictionary alloc] init];\
dic[@"description"] = [NSString per_parameterWithFormat:(fmt),##__VA_ARGS__];\
} \
return [RACSignal error: [NSError errorWithDomain:@"PERErrorDomain" code:PERErrorIllegalInput userInfo:dic]];\
}\
} while(0)

#endif /* PERMacro_h */
