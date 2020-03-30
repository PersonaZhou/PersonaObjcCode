//
//  PERUserModel.m
//  PersonaObjcCode
//
//  Created by Persona on 2019/12/30.
//  Copyright © 2019 ZhouShisong. All rights reserved.
//

#import "PERUserModel.h"

@implementation PERUserModel

- (id)initWithCoder:(NSCoder *)coder {
    if (self = [super init]) {
        self.userId = [coder decodeObjectForKey:@"userId"];
        self.phone = [coder decodeObjectForKey:@"phone"];
        self.location = [coder decodeObjectForKey:@"location"];
        self.gender = [coder decodeObjectForKey:@"gender"];
        self.nickname = [coder decodeObjectForKey:@"nickname"];
        self.avatar = [coder decodeObjectForKey:@"avatar"];
        self.token = [coder decodeObjectForKey:@"token"];
        self.ana = [coder decodeObjectForKey:@"ana"];
    }
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)coder {
    [coder encodeObject:self.userId forKey:@"userId"];
    [coder encodeObject:self.phone forKey:@"phone"];
    [coder encodeObject:self.location forKey:@"location"];
    [coder encodeObject:self.gender forKey:@"gender"];
    [coder encodeObject:self.nickname forKey:@"nickname"];
    [coder encodeObject:self.avatar forKey:@"avatar"];
    [coder encodeObject:self.token forKey:@"token"];
    [coder encodeObject:self.ana forKey:@"ana"];
}

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end
