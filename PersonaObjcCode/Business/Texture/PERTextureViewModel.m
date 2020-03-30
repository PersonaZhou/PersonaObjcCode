//
//  PERTextureViewModel.m
//  PersonaObjcCode
//
//  Created by ZhouShisong on 2020/1/19.
//  Copyright © 2020 ZhouShisong. All rights reserved.
//

#import "PERTextureViewModel.h"
#import "PERNetwork+Texture.h"
#import "PERTextureModel.h"

@interface PERTextureViewModel ()

@property (nonatomic, strong, readwrite) RACCommand *loadCommand;

@property (nonatomic, copy, readwrite) NSArray *listArray;

@end

@implementation PERTextureViewModel

#pragma mark - request

- (RACCommand *)loadCommand {
    if (_loadCommand) return _loadCommand;
    
    @weakify(self);
    _loadCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id viewModel) {
        @strongify(self);
        return [[[self.services.network fetchListWithPage:1 pageSize:10] collect] doNext:^(NSArray<PERTextureModel *> *x) {
            for (PERTextureModel *texture in x) {
                texture.postUserNicknameAttribute = [self convertToAttributedStringWithPostUserNickname:texture.postUserNickname];
                texture.reportAttribute = [self convertToAttributedStringWithReport:texture.report];
                texture.locationAttribute = [self convertToAttributedStringWithLocation:texture.location];
                texture.dateAttribute = [self convertToAttributedStringWithDate:texture.date];
                
                for (PERTextureReplyModel *reply in texture.replys) {
                    reply.followerNameAttribute = [self convertToAttributedStringWithFollowerName:reply.followerName];
                    reply.reviewerNameAttribute = [self convertToAttributedStringWithReviewerName:reply.reviewerName];
                    reply.commentAttribute = [self convertToAttributedStringWithComment:reply.comment];
                }
            }
            self.listArray = x;
        }];
    }];
    
    return _loadCommand;
}

#pragma mark - prepare data

- (NSAttributedString *)convertToAttributedStringWithPostUserNickname:(NSString *)postUserNickname {
    if (!postUserNickname || postUserNickname.length == 0) return nil;
    
    NSDictionary *nicknameAttributesDic = @{
        NSFontAttributeName: [UIFont boldSystemFontOfSize:16],
        NSForegroundColorAttributeName: UIColorFromRGB(0x224b87)
    };
    NSAttributedString *result = [[NSAttributedString alloc] initWithString:postUserNickname attributes:nicknameAttributesDic];
    
    return result;
}

- (NSAttributedString *)convertToAttributedStringWithReport:(NSString *)report {
    if (!report || report.length == 0) return nil;
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = 3.f;
    
    NSDictionary *messageAttributesDic = @{
        NSFontAttributeName: [UIFont systemFontOfSize:15],
        NSForegroundColorAttributeName: UIColorFromRGB(0x000000),
        NSParagraphStyleAttributeName: paragraphStyle
    };
    NSAttributedString *result = [[NSAttributedString alloc] initWithString:report attributes:messageAttributesDic];
    
    return result;
}

- (NSAttributedString *)convertToAttributedStringWithLocation:(NSString *)location {
    if (!location || location.length == 0) return nil;
    
    NSDictionary *locationAttributesDic = @{
        NSFontAttributeName: [UIFont systemFontOfSize:13],
        NSForegroundColorAttributeName: UIColorFromRGB(0x224b87)
    };
    NSAttributedString *result = [[NSAttributedString alloc] initWithString:location attributes:locationAttributesDic];
    
    return result;
}

- (NSAttributedString *)convertToAttributedStringWithDate:(NSString *)date {
    if (!date || date.length == 0) return nil;
    
    NSDictionary *dateAttributesDic = @{
        NSFontAttributeName: [UIFont systemFontOfSize:13],
        NSForegroundColorAttributeName: UIColorFromRGB(0xb3b4b3)
    };
    NSAttributedString *result = [[NSAttributedString alloc] initWithString:date attributes:dateAttributesDic];
    
    return result;
}

- (NSAttributedString *)convertToAttributedStringWithFollowerName:(NSString *)followerName {
    if (!followerName || followerName.length == 0) return nil;
    
    NSDictionary *dateAttributesDic = @{
        NSFontAttributeName: [UIFont boldSystemFontOfSize:15],
        NSForegroundColorAttributeName: UIColorFromRGB(0x224b87)
    };
    NSAttributedString *result = [[NSAttributedString alloc] initWithString:followerName attributes:dateAttributesDic];
    
    return result;
}

- (NSAttributedString *)convertToAttributedStringWithReviewerName:(NSString *)reviewerName {
    if (!reviewerName || reviewerName.length == 0) return nil;
    
    NSDictionary *dateAttributesDic = @{
        NSFontAttributeName: [UIFont boldSystemFontOfSize:15],
        NSForegroundColorAttributeName: UIColorFromRGB(0x224b87)
    };
    NSAttributedString *result = [[NSAttributedString alloc] initWithString:reviewerName attributes:dateAttributesDic];
    
    return result;
}

- (NSAttributedString *)convertToAttributedStringWithComment:(NSString *)comment {
    if (!comment || comment.length == 0) return nil;
    
    NSDictionary *dateAttributesDic = @{
        NSFontAttributeName: [UIFont systemFontOfSize:14],
        NSForegroundColorAttributeName: UIColorFromRGB(0x333333)
    };
    NSAttributedString *result = [[NSAttributedString alloc] initWithString:comment attributes:dateAttributesDic];
    
    return result;
}

@end
