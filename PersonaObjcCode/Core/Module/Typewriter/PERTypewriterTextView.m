//
//  PERTypewriterTextView.m
//  PersonaObjcCode
//
//  Created by ZhouShisong on 2020/3/29.
//  Copyright © 2020 ZhouShisong. All rights reserved.
//

#import "PERTypewriterTextView.h"

@interface PERTypewriterTextView ()

@property (nonatomic, strong) NSTimer *timer;

@end

@implementation PERTypewriterTextView

- (instancetype)init {
    if (self = [super init]) {
        self.interval = 0.3;
        
         [self addObserver:self forKeyPath:@"contentSize" options:(NSKeyValueObservingOptionNew) context:NULL];
    }
    return self;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    if ([keyPath isEqualToString:@"contentSize"]) {
        UITextView *textView = object;
        CGFloat deadSpace = (textView.bounds.size.height - textView.contentSize.height);
        CGFloat inset = MAX(0, deadSpace / 2.0);
        textView.contentInset = UIEdgeInsetsMake(inset, textView.contentInset.left, inset, textView.contentInset.right);
    }
}

- (void)startInput {
    if (self.timer) {
        [self.timer invalidate];
        self.timer = nil;
        self.startIndex = 0;
    }
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:self.interval
                                                  target:self
                                                selector:@selector(inputWord:)
                                                userInfo:nil
                                                 repeats:YES];
    
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}

- (void)inputWord:(NSTimer *)timer {
    if (self.content.length <= self.startIndex) {
        [timer invalidate];
        timer = nil;
        if (self.inputFinishBlock) {
            self.inputFinishBlock();
        }
    }else {
        self.startIndex ++;
        self.text = [self.content substringToIndex:self.startIndex];
        [self scrollRangeToVisible:NSMakeRange(self.text.length, 1)];
    }
}

- (void)dealloc {
    [self removeObserver:self forKeyPath:@"contentSize"];
}

@end
