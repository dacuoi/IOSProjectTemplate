//
//  BaseActionEvent.m
//  Skya
//
//  Created by Hai Truong Cong on 2/3/16.
//  Copyright © 2016 mideas. All rights reserved.
//


#import "BaseActionEvent.h"

@implementation BaseActionEvent

@synthesize viewData;
@synthesize userData;
@synthesize observer;
@synthesize sender;
@synthesize identity;
@synthesize tag;
@synthesize action;

- (id) init {
    self = [super init];
    if (self) {
        //init here
        self.viewData = nil;
        self.userData = nil;
        self.observer = nil;
        self.sender = nil;
        self.identity = nil;
        tag = 0;
    }
    return self;
}

@end
