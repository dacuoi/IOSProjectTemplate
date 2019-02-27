//
//  AppController.h
//  iosProjectTemplate
//
//  Created by tranquangson on 2/27/19.
//  Copyright © 2019 tranquangson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseModelEvent.h"
#import "BaseActionEvent.h"

@interface AppController : NSObject

+ (AppController *)getController;

- (void)handleViewEvent:(BaseActionEvent *)actionEvent;
- (void)handleChangeViewEvent:(BaseActionEvent *)actionEvent;
- (void)receiveDataFromModel:(BaseModelEvent *)modelEvent;
- (void)receiveErrorFromModel:(BaseModelEvent *)modelEvent;

@end
