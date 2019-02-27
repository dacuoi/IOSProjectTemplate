//
//  BaseViewController.h
//  iosProjectTemplate
//
//  Created by tranquangson on 2/27/19.
//  Copyright © 2019 tranquangson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseActionEvent.h"
#import "BaseModelEvent.h"
#import "AppController.h"

@interface BaseViewController : UIViewController
// Receive data from model
- (void)receiveDataFromModel:(BaseModelEvent*)modelEvent;
- (void)receiveErrorFromModel:(BaseModelEvent*)modelEvent;

@end
