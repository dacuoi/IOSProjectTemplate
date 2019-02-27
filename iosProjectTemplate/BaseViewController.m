//
//  BaseViewController.m
//  iosProjectTemplate
//
//  Created by tranquangson on 2/27/19.
//  Copyright © 2019 tranquangson. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

#pragma mark - Receive data from model
- (void) receiveDataFromModel: (BaseModelEvent*) modelEvent {
    
}

- (void) receiveErrorFromModel: (BaseModelEvent*) modelEvent {
    NSString *strMessage = NSLocalizedString(@"can_not_connect_server", nil);
    if(modelEvent.modelMessage.length>0){
        strMessage = modelEvent.modelMessage;
    }
    NSLog(strMessage);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
