//
//  BaseModelEvent.h
//  Skya
//
//  Created by Hai Truong Cong on 2/3/16.
//  Copyright © 2016 mideas. All rights reserved.
//


#import <Foundation/Foundation.h>
#import "BaseActionEvent.h"

@interface BaseModelEvent : NSObject

@property (nonatomic, strong) BaseActionEvent* actionEvent;
@property (nonatomic, strong) id modelData;
@property (nonatomic, assign) int modelCode;
@property (nonatomic, copy) NSString* modelMessage;

@end
