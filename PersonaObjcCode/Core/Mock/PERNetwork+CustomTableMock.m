//
//  PERNetwork+CustomTableMock.m
//  PersonaObjcCode
//
//  Created by ZhouShisong on 2020/3/31.
//  Copyright © 2020 ZhouShisong. All rights reserved.
//

#import "PERNetwork+CustomTableMock.h"

@implementation PERNetwork (CustomTableMock)

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

@end
