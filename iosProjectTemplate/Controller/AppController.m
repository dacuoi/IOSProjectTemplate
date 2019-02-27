//
//  AppController.m
//  iosProjectTemplate
//
//  Created by tranquangson on 2/27/19.
//  Copyright © 2019 tranquangson. All rights reserved.
//

#import "AppController.h"
#import "AppService.h"
#import "BaseViewController.h"

@implementation AppController

AppController *appController = nil;

+ (AppController *)getController
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        appController = [[AppController alloc] init];
    });
    return appController;
}

- (void)handleViewEvent:(BaseActionEvent *)actionEvent
{
    switch (actionEvent.action)
    {
        case requestSendNotification:
        {
            [[AppService getService] sendModelRequest:actionEvent];
        }
            break;
            
        case checkUserEmail:
        case requestForgotPass:
        case requestAllUser:
        case requestCreateNewUser:
        case requestUpdateUser:
        case requestDeleteUser:
        case requestUpdateWelcome:
        case requestUpdateProfile:
        case requestChangePass:
        {
            [[AppService getService] sendModelRequest:actionEvent];
        }
            break;
            
        case requestGoogleLogin:
        {
            [[AppService getService] sendModelRequest:actionEvent];
        }
            break;
            
        case requestCreateProject:
        case requestAllProject:
        case requestProjectDetail:
        case requestReadProject:
        case requestLeaveProject:
        case requestInviteClientProject:
        case requestUpdateProject_DueDate:
        case requestUpdateProject_Description:
        {
            [[AppService getService] sendModelRequest:actionEvent];
        }
            break;
        case requestUpdateDocumentInfo:
        case requestAttachmentsProject:
        case requestCreateDocument:
        case requestDocumentsProject:{
            [[AppService getService] sendModelRequest:actionEvent];
        }
            break;
            
        case requestUpdateChecklist_Name:
        case requestUpdateChecklist_Assignee:
        case requestUpdateChecklist_Duedate:
        case requestUpdateChecklist_Priority:
        case requestUpdateChecklist_Description:
        case addNewChecklist:
        case archiveChecklist:
        case updateChecklistName:
        case updateChecklistStatus:
        case startDisChecklist:
        case removeChecklist:
        case requestDisChecklist:
        case requestAllChecklist:
        {
            [[AppService getService] sendModelRequest:actionEvent];
        }
            break;
        case requestAllQuestion:
        case requestAskQuestion:
        case requestAnswerQuestion:
        case requestVoteQuestion:
        {
            [[AppService getService] sendModelRequest:actionEvent];
        }
            break;
        case requestAllNotification:
        case readNotification:
        case readAllNotification:{
            [[AppService getService] sendModelRequest:actionEvent];
        }
            break;
            
        case requestAssocialWithTask_Attachment:
        case requestAssocialWithTask_Document:{
            [[AppService getService] sendModelRequest:actionEvent];
        }
            break;
        case getMessageBySize:
        case sendTextMessage:
        {
            [[AppService getService] sendModelRequest:actionEvent];
        }
            break;
        case requestCreateConversation:{
            [[AppService getService] sendModelRequest:actionEvent];
        }
            break;
        default:
        {
            [[AppService getService] sendModelRequest:actionEvent];
        }
            break;
    }
}


- (void) handleChangeViewEvent:(BaseActionEvent*) actionEvent {
    switch (actionEvent.action) {
        case gotoLoginView: {
            //            SignupViewController* signupViewController = [[SignupViewController alloc] initWithNibName:nil bundle:nil];
            //            [signupViewController showView:actionEvent withAnimation:YES];
        }
            break;
            
        default:
            break;
    }
}
- (void)receiveDataFromModel:(BaseModelEvent *)modelEvent
{
    switch (modelEvent.actionEvent.action)
    {
        default:
        {
            if ([modelEvent.actionEvent.sender isKindOfClass:[BaseViewController class]])
            {
                if(modelEvent.actionEvent.action == requestSendNotification){
                    
                }
                else{
                    BaseViewController *view = (BaseViewController *) modelEvent.actionEvent.sender;
                    [view receiveDataFromModel:modelEvent];
                }
            }
        }
            break;
    }
}


- (void)receiveErrorFromModel:(BaseModelEvent *)modelEvent
{
    switch (modelEvent.actionEvent.action)
    {
        case requestAllUser:
        {
            BaseViewController* view = (BaseViewController *) modelEvent.actionEvent.sender;
            [view receiveErrorFromModel:modelEvent];
        }
            break;
        case requestSendNotification:
        {
        
        }
            break;
            
        default:
        {
            if ([modelEvent.actionEvent.sender isKindOfClass:[BaseViewController class]])
            {
                BaseViewController *view = (BaseViewController *) modelEvent.actionEvent.sender;
                [view receiveErrorFromModel:modelEvent];
            }
        }
            break;
    }
}

@end
