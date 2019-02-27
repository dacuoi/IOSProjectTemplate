//
//  BaseActionEvent.h
//  Skya
//
//  Created by Hai Truong Cong on 2/3/16.
//  Copyright © 2016 mideas. All rights reserved.
//


#import <Foundation/Foundation.h>

enum ActionEventEnum
{
    // API
    checkUserEmail,
    requestAllUser,
    requestCreateNewUser,
    requestUpdateUser,
    requestDeleteUser,
    requestForgotPass,
    //Project
    requestAllProject,
    requestCreateProject,
    requestProjectDetail,
    requestLeaveProject,
    
    requestUpdateProject_NoneUpdate,
    requestUpdateProject_New,
    requestUpdateProject_Name,
    requestUpdateProject_DueDate,
    requestUpdateProject_Description,
    requestUpdateProject_User,
    
    requestAttachmentsProject,
    requestDocumentsProject,
    requestInviteClientProject,
    requestRemoveClientProject,
    requestReadProject,
    requestCreateDocument,
    
    //Checklist
    addNewChecklist,
    archiveChecklist,
    updateChecklistName,
    updateChecklistStatus,
    removeChecklist,
    startDisChecklist,
    requestDisChecklist,
    requestAllChecklist,
    
    requestUpdateChecklist_NonUpdate,
    requestUpdateChecklist_New,
    requestUpdateChecklist_Name,
    requestUpdateChecklist_Duedate,
    requestUpdateChecklist_Assignee,
    requestUpdateChecklist_Priority,
    requestUpdateChecklist_Description,
    //
    //Conversation
    requestCreateConversation,
    //Message
    getMessageBySize,
    sendTextMessage,
    sendImageMessage,
    //
    requestGoogleLogin,
    requestChangePass,
    //Q&A
    requestAllQuestion,
    requestAskQuestion,
    requestAnswerQuestion,
    requestVoteQuestion,
    //Notificaiton
    requestAllNotification,
    readNotification,
    readAllNotification,
    //Document
    requestUpdateDocumentInfo,
    requestAssocialWithTask_New,
    requestAssocialWithTask_Attachment,
    requestAssocialWithTask_Document,
    //
    requestUpdateDocumentInfo_Modify,
    requestUpdateDocumentInfo_Opened,
    requestUpdateDocumentInfo_Name,
    //
    requestGoogleDrawLine,
    textSuggestion,
    requestOTP,
    requestLogin,
    requestSignUp,
    requestLoginOtherApp,
    requestUpdateProfile,
    requestUpdateWelcome,
    requestSendNotification,
    
    requestUploadMedia,
    requestUploadAvatar,
    requestDownloadMedia,
    checkVersion,
    updateContact,
    addContact,
    getUserInfo,
    updateUserInfo,
    unreadMessage,
    inviteUseApp,
    requestGetServiceAround,
    requestGetCerLocationAround,
    //dominhtan
    requestGetService,
    requestAddTip,
    
    //Change View
    gotoInputCode,
    gotoGetUserInfo,
    
    gotoLoginView, //quannt19
    
    // XMPP
    saveXMPPImageMessage,
    saveXMPPVoiceMessage,
    saveXMPPLocationMessage,
    sendXMPPTextMessage,
    sendXMPPImageMessage,
    sendXMPPVoiceMessage,
    sendXMPPContactMessage,
    sendXMPPStickerMessage,
    sendXMPPLocationMessage,
    sendXMPPStateMessage,
    sendXMPPPresent,
    sendXMPPIQSubscribe,
    sendXMPPPresenceGetInfo,
    sendXMPPPlaceSuggestionMessage,
    sendXMPPPlaceServiceMessage,
    
    //Social
    requestUploadImagePost,
    requestDownloadImagePost,
    
    //Group
    leftGroup,
    createGroup,
    inviteGroup,
    renameGroup,
    getInfoGroup,
    sendXMPPIQ,
    
    //Google vision API
    sendLabelDetection,
    sendTextDetection,
    sendSpeechDetection
};

@interface BaseActionEvent : NSObject

@property (nonatomic, strong) id viewData;
@property (nonatomic, strong) id userData;
@property (nonatomic, strong) id observer;
@property (nonatomic, strong) id sender;
@property (nonatomic, strong) id identity;
@property (nonatomic, assign) int tag;
@property (nonatomic, assign) enum ActionEventEnum action;

@end
