//
//  PERNetwork+HomeMock.m
//  PersonaObjcCode
//
//  Created by ZhouShisong on 2020/3/31.
//  Copyright © 2020 ZhouShisong. All rights reserved.
//

#import "PERNetwork+HomeMock.h"

@implementation PERNetwork (HomeMock)

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
        
        
        NSDictionary *rac_url_1 = @{@"title": @"ReactiveCocoa 基础",
                                    @"url": @"https://zhoushisong.cn/2019/11/15/ReactiveCocoa%20%E5%9F%BA%E7%A1%80/"};
        NSDictionary *rac_url_2 = @{@"title": @"ReactiveCocoa 进阶",
                                    @"url": @"https://zhoushisong.cn/2019/11/21/ReactiveCocoa%20%E8%BF%9B%E9%98%B6/"};
        NSDictionary *rac_url_3 = @{@"title": @"ReactiveCocoa 使用中注意项",
                                    @"url": @"https://zhoushisong.cn/2019/11/23/ReactiveCocoa%20%E4%BD%BF%E7%94%A8%E4%B8%AD%E6%B3%A8%E6%84%8F%E9%A1%B9/"};
        NSArray *rac_urls = @[rac_url_1, rac_url_2, rac_url_3];
        
        NSDictionary *rac = @{
            @"imgName": @"icon_rac",
            @"title": @"ReactiveCocoa",
            @"introduction": @"ReactiveCocoa是GitHub上一个开源的函数响应式（Functional Reactive Programming）框架，提供Objective-C和Swift，为绑定ViewModel和响应式编程提供了便利。",
            @"urls": rac_urls,
        };
        
        [subscriber sendNext:texture];
        [subscriber sendNext:yoga];
        [subscriber sendNext:customTable];
        [subscriber sendNext:rac];
        
        [subscriber sendCompleted];
        return nil;
    }];
}

@end
