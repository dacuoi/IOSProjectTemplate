//
//  BaseModelEvent.m
//  Skya
//
//  Created by Hai Truong Cong on 2/3/16.
//  Copyright © 2016 mideas. All rights reserved.
//


#import "BaseModelEvent.h"

@implementation BaseModelEvent

@synthesize actionEvent;
@synthesize modelCode;
@synthesize modelData;
@synthesize modelMessage;

- (id) init {
    self = [super init];
    if (self) {
        //init here
        self.actionEvent = nil;
        self.modelMessage = @"";
        self.modelData = nil;
        modelCode = 0;
    }
    return self;
}

@end
