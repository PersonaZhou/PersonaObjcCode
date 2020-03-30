//
//  PERNetwork+Mock.m
//  PersonaObjcCode
//
//  Created by Persona on 2020/1/5.
//  Copyright © 2020 ZhouShisong. All rights reserved.
//

#import "PERNetwork+Mock.h"

@implementation PERNetwork (Mock)

- (RACSignal *)requestPostWithPath:(NSString *)path contentType:(PERRequestContentType)type parameters:(NSDictionary *)parameters {
    
    RACSignal *s = [RACSignal empty];
    
    if ([path isEqualToString:@"/login/send_sms_code"]) {
        s = [self fetchSMSCodeWithParameters:parameters];
    }else if ([path isEqualToString:@"/login/sigin_by_sms_code"]) {
        s = [self loginBySMSCodeWithParameters:parameters];
    }else if ([path isEqualToString:@"/home/banner"]) {
        s = [self fetchHomeBanner:parameters];
    }else if ([path isEqualToString:@"/home/list"]) {
        s = [self fetchHomeList:parameters];
    }else if ([path isEqualToString:@"/texture/list"]) {
        s = [self fetchTextureList:parameters];
    }else if ([path isEqualToString:@"/customtable/record"]) {
        s = [self fetchCustomTableBanner:parameters];
    }else if ([path isEqualToString:@"/customtable/list"]) {
        s = [self fetchCustomTableList:parameters];
    }
    
    return s;
}

- (RACSignal *)fetchSMSCodeWithParameters:(NSDictionary *)parameters {
    return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        [subscriber sendNext:@{@"status": @YES, @"message": @"短信验证码发送成功，请注意查收"}];
        [subscriber sendCompleted];
        return nil;
    }];
}

- (RACSignal *)loginBySMSCodeWithParameters:(NSDictionary *)parameters {
    return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        NSDictionary *dict = @{
            @"userId": @"PER_1319488431",
            @"phone": @"182******663",
            @"location": @"成都市 · 高新区天府大道北段1700号(环球中心)",
            @"gender": @"male",
            @"nickname": @"Pྉeྉrྉsྉoྉnྉaྉ",
            @"avatar": @"avatar_persona",
            @"ana": @"你学过的每一样东西，你遭受的每一次苦难，都会在你一生中的某个时候派上用场。",
            @"token": @"NUSER_D239JdowSKDmcjkadeqiodaXDAFE",
        };
        
        [subscriber sendNext:dict];
        [subscriber sendCompleted];
        
//        NSError *error = [NSError errorWithDomain:NSURLErrorDomain code:1 userInfo:@{NSLocalizedDescriptionKey: @"抱歉哦~ 服务器已宕机"}];
//        [subscriber sendError:error];
        
        return nil;
    }];
}

- (RACSignal *)fetchHomeBanner:(NSDictionary *)parameters {
    return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        NSDictionary *personaDic = @{
            @"imgName": @"banner_persona",
            @"title": @"Persona's blog",
            @"url": @"https://zhoushisong.cn"
        };
        
        NSDictionary *githubDic = @{
            @"imgName": @"banner_github",
            @"title": @"Persona's github page",
            @"url": @"https://github.com/ZhouShisong"
        };
        
        NSDictionary *wwdcDic = @{
            @"imgName": @"banner_wwdc",
            @"title": @"Apple Developer",
            @"url": @"https://developer.apple.com"
        };
        
        NSDictionary *appleDic = @{
            @"imgName": @"banner_mac",
            @"title": @"Apple",
            @"url": @"https://www.apple.com.cn"
        };
        
        /*
        NSDictionary *swiftDic = @{
            @"imgName": @"banner_swift",
            @"title": @"Swift",
            @"url": @"https://docs.swift.org/swift-book/",
        };
         */
        
        [subscriber sendNext:personaDic];
        [subscriber sendNext:githubDic];
        [subscriber sendNext:wwdcDic];
        [subscriber sendNext:appleDic];
//        [subscriber sendNext:swiftDic];
        [subscriber sendCompleted];
        return nil;
    }];
}

- (RACSignal *)fetchHomeList:(NSDictionary *)parameters {
    return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        NSDictionary *texture = @{
            @"imgName": @"icon_texture",
            @"title": @"Texture(AsyncDisplayKit)",
            @"introduction": @"Texture是有Facebook开发，才用图形异步渲染，基于UIKit构建的框架，即使是最复杂的用户界面也能保持流畅和极快响应。",
            @"url": @"persona://code/texture",
        };
        
        NSDictionary *yoga = @{
            @"imgName": @"icon_yoga",
            @"title": @"YogaKit",
            @"introduction": @"Yoga是一个由Facebook开发的，一个基于Flexbox的跨平台布局引擎，支持多语言如Java、C#、C 、Objective-C、Swift，后集成进React Native/Litho/Componentkit。",
            @"url": @"persona://code/yoga",
        };
        
        NSDictionary *customTable = @{
            @"imgName": @"icon_table",
            @"title": @"CustomTable",
            @"introduction": @"这是一个自定义的UITableView的组件，基于MVVM和RAC，实现了View和ViewModel的绑定，在ViewController中实现复杂的页面仅需要极少的代码。",
            @"url": @"persona://code/custom_table",
        };
        
        
        [subscriber sendNext:texture];
        [subscriber sendNext:yoga];
        [subscriber sendNext:customTable];
        
        [subscriber sendCompleted];
        return nil;
    }];
}

- (RACSignal *)fetchCustomTableBanner:(NSDictionary *)parameters {
    return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        NSDictionary *dict1 = @{
            @"title": @"简·爱",
        };
        
        NSDictionary *dict2 = @{
            @"title": @"时间简史",
        };
        
        NSDictionary *dict3 = @{
            @"title": @"战国策",
        };
        
        NSDictionary *dict4 = @{
            @"title": @"如你一样的好",
        };
        
        NSDictionary *dict5 = @{
            @"title": @"追风筝的人",
        };
        
        NSDictionary *dict6 = @{
            @"title": @"自控力",
        };
        
        NSDictionary *dict7 = @{
            @"title": @"莫若相逢于江湖",
        };
        
        NSDictionary *dict8 = @{
            @"title": @"乔布斯传",
        };
        
        NSDictionary *dict9 = @{
            @"title": @"次第花开",
        };
        
        NSDictionary *dict10 = @{
            @"title": @"自控力",
        };
        
        NSDictionary *dict11 = @{
            @"title": @"窗外",
        };
        
        NSDictionary *dict12 = @{
            @"title": @"春风十里不如你",
        };
        
        NSDictionary *dict13 = @{
            @"title": @"先秦诸子",
        };
        
        [subscriber sendNext:dict1];
        [subscriber sendNext:dict2];
        [subscriber sendNext:dict3];
        [subscriber sendNext:dict4];
        [subscriber sendNext:dict5];
        [subscriber sendNext:dict6];
        [subscriber sendNext:dict7];
        [subscriber sendNext:dict8];
        [subscriber sendNext:dict9];
        [subscriber sendNext:dict10];
        [subscriber sendNext:dict11];
        [subscriber sendNext:dict12];
        [subscriber sendNext:dict13];
        [subscriber sendCompleted];
        return nil;
    }];
}

- (RACSignal *)fetchCustomTableList:(NSDictionary *)parameters {
    return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        NSDictionary *dict1 = @{
            @"thumbnail": @"fiction_cover_1",
            @"title": @"《乔布斯传》",
            @"introduction": @"2004年的初夏，我接到史蒂夫·乔布斯（SteveJobs）打来的电话。多年来，他对我还算友好，偶尔还会感情骤增一下，特别是当他希望即将推出的新产品能上《时代》杂志封面或者CNN（美国有线电视新闻网）专题报道的时候，而这两处恰好都是我曾工作过的地方。在我离开这两家媒体之后，就没有太多他的消息了......",
        };
        
        NSDictionary *dict2 = @{
            @"thumbnail": @"fiction_cover_2",
            @"title": @"《这世界偷偷爱着你》",
            @"introduction": @"有人自远方来，叩我柴扉，许我桃花。所以你从来不是为了离开的他，而是为了下一个即将到来的他。我们不太习惯的那些爱，我爱了，你随意 爱是测谎仪......",
        };
        
        NSDictionary *dict3 = @{
            @"thumbnail": @"fiction_cover_3",
            @"title": @"从你的全世界路过",
            @"introduction": @"该书由38个“睡前故事”组成，这些故事中有一半是爱情故事。纵览全书发现，这些小故事各有特点，主角以善良人物为主，诙谐幽默的俚语和脏话夹杂文中，结局总是“痴情者必有善终”。故事最后一般有一段抒情议论，排比流畅，文字感性细腻......",
        };
        
        NSDictionary *dict4 = @{
            @"thumbnail": @"fiction_cover_4",
            @"title": @"《不为难自己,不讨好世界》",
            @"introduction": @"我们一辈子都在寻找、等待那个人，若干年后，与记忆相关的，只有一个个流传下来的故事。 我遇到了形形色色的人，有为了自由远走天涯的摄影师，有摆摊卖故事立志成为画家的女孩，有患抑郁症的摩托车手，有在酒吧唱歌不停换男友的女歌手，有失去声音的配音演员，还有严重失眠症的作家......",
        };
        
        NSDictionary *dict5 = @{
            @"thumbnail": @"fiction_cover_5",
            @"title": @"《笑傲江湖》",
            @"introduction": @"和风熏柳，花香醉人，正是南国春光漫烂季节。福建省福州府西门大街，青石板路笔直的伸展出去，直通西门。一座建构宏伟的宅第之前，左右两座石坛中各竖一根两丈来高的旗杆，杆顶飘扬青旗。右首旗上黄色丝线绣着一头张牙舞爪、神态威猛的雄狮，旗子随风招展，显得雄狮更奕奕若生......",
        };
        
        NSDictionary *dict6 = @{
            @"thumbnail": @"fiction_cover_6",
            @"title": @"《天龙八部》",
            @"introduction": @"青光闪动，一柄青钢剑倏地刺出，指向在年汉子左肩，使剑少年不等招用老，腕抖剑斜，剑锋已削向那汉子右颈，那中年汉子剑挡格，铮的一声响，双剑相击，嗡嗡作声，震声未绝，双剑剑光霍霍，已拆了三招，中年汉子长剑猛地击落，直砍少年顶门。那少年避向右侧，左手剑诀一引，青钢剑疾刺那汉子大腿......",
        };
        
        NSDictionary *dict7 = @{
            @"thumbnail": @"fiction_cover_7",
            @"title": @"《诛仙》",
            @"introduction": @"青云山连绵百里,峰峦起伏,最高有七峰,高耸入云,平日里只见白云环绕山腰,不识山顶真容。青云山山林密布,飞瀑奇岩,珍禽异兽,在所多有,景色幽险奇峻,天下闻名。只是更有名的,却是在这山上的修真门派——青云门...",
        };
        
        NSDictionary *dict8 = @{
            @"thumbnail": @"fiction_cover_8",
            @"title": @"《白夜追凶》",
            @"introduction": @"一场灭门惨案，让原本逍遥浪荡的关宏宇成了在逃通缉嫌犯，身为刑侦支队队长的双胞胎哥哥关宏峰誓要查出真相，但出于亲属回避的原则，警队禁止他参与灭门案的调查，关宏峰义愤辞职......",
        };
        
        NSDictionary *dict9 = @{
            @"thumbnail": @"fiction_cover_9",
            @"title": @"《大秦帝国》",
            @"introduction": @"大秦帝国是中国文明的正源。大秦帝国所处的时代是中国五千年文明史中最重要的一个时代。不幸的是，作为统一帝国的短促与后来以儒家观念为核心的官方意识形态的刻意贬损，秦帝国在“暴虐苛政”的恶名下几乎湮没在历史的沉沉烟雾之中。有限史料所显示的错讹断裂且不必论，明清通俗小说《东周列国志》、《二十四史演义》等通俗史话作品，对秦帝国的描述更是鲁莽灭裂，放肆亵渎，竟然将这段历史涂抹得狰狞可怖面目全非......",
        };
        
        NSDictionary *dict10 = @{
            @"thumbnail": @"fiction_cover_10",
            @"title": @"《三国演义》",
            @"introduction": @"滚滚长江东逝水，浪花淘尽英雄。是非成败转头空。青山依旧在，几度夕阳红。白发渔樵江渚上，惯看秋月春风。一壶浊酒喜相逢。古今多少事，都付笑谈中......",
        };
        
        [subscriber sendNext:dict1];
        [subscriber sendNext:dict2];
        [subscriber sendNext:dict3];
        [subscriber sendNext:dict4];
        [subscriber sendNext:dict5];
        [subscriber sendNext:dict6];
        [subscriber sendNext:dict7];
        [subscriber sendNext:dict8];
        [subscriber sendNext:dict9];
        [subscriber sendNext:dict10];
        
        [subscriber sendCompleted];
        return nil;
    }];
}

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
