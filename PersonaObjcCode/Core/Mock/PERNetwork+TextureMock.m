//
//  PERNetwork+TextureMock.m
//  PersonaObjcCode
//
//  Created by ZhouShisong on 2020/3/31.
//  Copyright © 2020 ZhouShisong. All rights reserved.
//

#import "PERNetwork+TextureMock.h"

@implementation PERNetwork (TextureMock)

- (RACSignal *)fetchTextureList:(NSDictionary *)parameters {
    return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        NSArray *reportImages = @[
            @"https://note.youdao.com/yws/api/personal/file/af95090671407f40edf79dde019d3332?method=download&shareKey=aa140b761319815e50f1cf11b5f4b331",
            @"https://note.youdao.com/yws/api/personal/file/b82dc54553dfd589fa2e215f8b22fde9?method=download&shareKey=451ee71b5b4a9d66640f72dcb5e7f741",
            @"https://note.youdao.com/yws/api/personal/file/63df4785cb11665d97d142527826fbca?method=download&shareKey=efaec2c9536f51135aaba617803b16d3",
            @"https://note.youdao.com/yws/api/personal/file/f67f50c788bb4c052614858a4ff7050b?method=download&shareKey=415313518288668de1034508b225d958",
            @"https://note.youdao.com/yws/api/personal/file/e466464b75837f08d77db7a7d81ad8d7?method=download&shareKey=b6093edd82ae8b6549a93982d48064f2",
            @"https://note.youdao.com/yws/api/personal/file/aa1ad8e5f5ee3bb16228b5c58bc315b1?method=download&shareKey=cdfbbd9b75c7d5668f3cb7c813308c40",
            @"https://note.youdao.com/yws/api/personal/file/09a7f973d6360ff8aab79e69f23234a5?method=download&shareKey=9ab3ed4ee0b799b70c7755da49ff4c19",
            @"https://note.youdao.com/yws/api/personal/file/10adf84e2f40b6ca17de577e4eccf15c?method=download&shareKey=859e530a7fea0919bbc707b346459e47"];
        
        NSArray *likeAvatars = @[
            @"https://note.youdao.com/yws/api/personal/file/89676225426d99490155f2ac2225fa86?method=download&shareKey=a5a6482244a74a3becf397bfcfa228f7",
            @"https://note.youdao.com/yws/api/personal/file/616c537ec90b379b4e910016a1113264?method=download&shareKey=8a1106d876bc0501365f07999b129e04",
            @"https://note.youdao.com/yws/api/personal/file/e32a4effba32aa71f655474442c4692e?method=download&shareKey=8eb809892bb9a9974a314eb96d746952",
            @"https://note.youdao.com/yws/api/personal/file/c72296e54bcbd87ed8ad342531d95291?method=download&shareKey=21079127a83ef6437377cd390a1859cb",
            @"https://note.youdao.com/yws/api/personal/file/008c946d115f1267d6d33806b76cdbc0?method=download&shareKey=278f6664d5d07456734b6772342789ae"];
        
        NSDictionary *replyDic1 = @{
            @"avatar": @"https://note.youdao.com/yws/api/personal/file/616c537ec90b379b4e910016a1113264?method=download&shareKey=8a1106d876bc0501365f07999b129e04",
            @"followerName": @"茜茜",
            @"comment": @"那你还要去健身房吗？🙄上回你办的年卡才去过三次，😁😁😁小心噜甲噜胖哦！"};
        
        NSDictionary *replyDic2 = @{
        @"avatar": @"https://note.youdao.com/yws/api/personal/file/7bb16eeb05200a65be8eff922365557e?method=download&shareKey=1adc35c681584246e6640671472ea3a1",
        @"followerName": @"wxy .💋",
        @"reviewerName": @"茜茜",
        @"comment": @"😂你要不嘛，我把卡廉价卖给你，我平时下班太晚啦，都没时间去。"};
        
        NSDictionary *replyDic3 = @{
        @"avatar": @"https://note.youdao.com/yws/api/personal/file/c72296e54bcbd87ed8ad342531d95291?method=download&shareKey=21079127a83ef6437377cd390a1859cb",
        @"followerName": @"ྉPྉeྉrྉsྉoྉnྉaྉ",
        @"reviewerName": @"wxy .💋",
        @"comment": @"你这可能不是没空，😂你怕是回了家就懒得翻身动一下了哦。我知道苏稽有家翘脚牛肉是老字号的，卖了几十年了，下回去的话喊上我一起噻！"};
        
        NSDictionary *replyDic4 = @{
        @"avatar": @"https://note.youdao.com/yws/api/personal/file/e32a4effba32aa71f655474442c4692e?method=download&shareKey=8eb809892bb9a9974a314eb96d746952",
        @"followerName": @"璇子",
        @"comment": @"乐山的小吃确实很巴适！😄成都很难吃到正宗的跷脚牛肉、豆腐脑、钵钵鸡和甜皮鸭那些，我之前在草堂那边吃过一家乐山钵钵鸡味道还可以，说是乐山本地人开的店，但是去晚了一点的话就挤得很，排队都要排很久"};
        
        NSDictionary *replyDic5 = @{
        @"avatar": @"https://note.youdao.com/yws/api/personal/file/7bb16eeb05200a65be8eff922365557e?method=download&shareKey=1adc35c681584246e6640671472ea3a1",
        @"followerName": @"wxy .💋",
        @"reviewerName": @"ྉPྉeྉrྉsྉoྉnྉaྉ",
        @"comment": @"好嘞！那你请客嘛！"};
        
        NSArray *replys = @[replyDic1, replyDic2, replyDic3, replyDic4, replyDic5];
        
        NSDictionary *dict1 = @{
            @"postUserAvatar": @"https://note.youdao.com/yws/api/personal/file/7bb16eeb05200a65be8eff922365557e?method=download&shareKey=1adc35c681584246e6640671472ea3a1",
            @"postUserNickname": @"wxy .💋",
            @"report": @"最近和朋友一起自驾游，从成都去乐山玩耍，去峨眉山滑雪后又去了苏稽吃跷脚牛肉，然后又去了乐山大佛、柳江古镇、三苏祠，终于吃到了正宗的豆腐脑、乐山钵钵鸡、乐山油炸串串，回成都又去吃了一顿藿香鱼捞和鲍鱼饭，😓😓😓感觉自己就像是一个吃货，控制不足自己的食欲......",
            @"reportImages": reportImages,
            @"location": @"成都市 · 高新区天府大道北段1700号(环球中心)",
            @"date": @"1小时前",
            @"likeAvatars": likeAvatars,
            @"replys": replys
        };
        
        [subscriber sendNext:dict1];
        [subscriber sendNext:dict1];
        [subscriber sendNext:dict1];
        [subscriber sendNext:dict1];
        [subscriber sendNext:dict1];
        [subscriber sendCompleted];
        return nil;
    }];
}


@end
