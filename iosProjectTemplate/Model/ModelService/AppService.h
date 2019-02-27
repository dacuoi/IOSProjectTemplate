//
//  AppService.h
//  Skya
//
//  Created by Hai Truong Cong on 2/3/16.
//  Copyright © 2016 mideas. All rights reserved.
//

#import "BaseModelEvent.h"

@interface AppService : NSObject

+ (AppService*) getService;

- (void)sendModelRequest:(BaseActionEvent *)actionEvent;
- (void)onReceivedError:(BaseActionEvent *)actionEvent withError:(NSString *)error;
- (void)onReceivedData:(BaseActionEvent *)actionEvent;

@end
