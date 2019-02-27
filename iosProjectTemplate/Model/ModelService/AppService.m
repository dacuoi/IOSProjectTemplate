//
//  AppService.m
//  Skya
//
//  Created by Hai Truong Cong on 2/3/16.
//  Copyright © 2016 mideas. All rights reserved.
//

#import "AppService.h"
#import "AppController.h"
#import "AFNetworking.h"

//Request type
#define TYPE_REQUEST_POST     1
#define TYPE_REQUEST_GET      2
#define TYPE_REQUEST_PUT      3
#define TYPE_REQUEST_DELETE   4

@interface AppService ()

@property (strong, nonatomic) AFHTTPRequestOperationManager *textSuggestionManager;

@end

@implementation AppService

AppService* appService = nil;

+ (AppService*) getService {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        appService = [[AppService alloc] init];
    });
    return appService;
}

- (void)sendRequestLogin:(BaseActionEvent*) actionEvent
{
    NSDictionary* dicData = (NSDictionary*) actionEvent.viewData;
    [self sendRequestWithParams:dicData withType:TYPE_REQUEST_POST andMethod:API_REQUEST_LOGIN andActionEvent:actionEvent isNeedToken:YES];
}


- (void) sendRequestWithParams:(NSDictionary*) params withType:(int)type andMethod:(NSString *)strMethod andActionEvent: (BaseActionEvent*) actionEvent isNeedToken:(BOOL)isNeed{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    [manager.requestSerializer setTimeoutInterval:30];
    [manager.operationQueue setMaxConcurrentOperationCount:10];
    //
    
    NSString *requestUrl = HTTP_REQUEST_PATH;
    
    NSString *strURL = [NSString stringWithFormat:@"%@%@",requestUrl,strMethod];
    NSLog(@"%@",params);
    if (type == TYPE_REQUEST_POST){
        [manager POST:strURL parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
            NSLog(@"%@",responseObject);
            [self onHttpReceivedData:actionEvent withReponseObject:responseObject];
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            int errorCode = (int)[operation.response statusCode];
            //
            BaseModelEvent *modelEvent = [[BaseModelEvent alloc] init];
            modelEvent.actionEvent = actionEvent;
            modelEvent.modelCode = errorCode;
            
            NSString *strMessage = nil;
            //
            if([strMethod isEqualToString:API_REQUEST_LOGIN]){
                NSDictionary *dictResponse = operation.responseObject;
                if(dictResponse[@"error"]){
                    if(dictResponse[@"error"][@"message"]){
                        strMessage = dictResponse[@"error"][@"message"];
                        //
                        modelEvent.modelData = strMessage;
                    }
                }
            }
            //
            [[AppController getController] receiveErrorFromModel:modelEvent];
        }];
    }
    else if (type == TYPE_REQUEST_GET){
        [manager GET:strURL parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
            [self onHttpReceivedData:actionEvent withReponseObject:responseObject];
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            int errorCode = (int)[operation.response statusCode];
            BaseModelEvent *modelEvent = [[BaseModelEvent alloc] init];
            modelEvent.actionEvent = actionEvent;
            modelEvent.modelCode = errorCode;
            [[AppController getController] receiveErrorFromModel:modelEvent];
            
        }];
    }
    else if (type == TYPE_REQUEST_PUT){
        //
        [manager PUT:strURL parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
            [self onHttpReceivedData:actionEvent withReponseObject:responseObject];
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            int errorCode = (int)[operation.response statusCode];
            BaseModelEvent *modelEvent = [[BaseModelEvent alloc] init];
            modelEvent.actionEvent = actionEvent;
            modelEvent.modelCode = errorCode;
            [[AppController getController] receiveErrorFromModel:modelEvent];
            
        }];
    }
    else if (type == TYPE_REQUEST_DELETE){
        //
        NSDictionary *params_New = [params copy];
        //
        [manager DELETE:strURL parameters:params_New success:^(AFHTTPRequestOperation *operation, id responseObject) {
            [self onHttpReceivedData:actionEvent withReponseObject:responseObject];
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            int errorCode = (int)[operation.response statusCode];
            BaseModelEvent *modelEvent = [[BaseModelEvent alloc] init];
            modelEvent.actionEvent = actionEvent;
            modelEvent.modelCode = errorCode;
            [[AppController getController] receiveErrorFromModel:modelEvent];
        }];
    }
}

- (void)runRequestOnBackgroundThread:(BaseActionEvent *)actionEvent andRequest:(NSMutableURLRequest*) request{
    NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^ (NSData *data, NSURLResponse *response, NSError *error) {
        [self onHttpReceivedData:actionEvent withReponseObject:data];
    }];
    [task resume];
}

- (void)sendModelRequest:(BaseActionEvent *)actionEvent
{
    switch (actionEvent.action)
    {
        case requestLogin:{
            [self sendRequestLogin:actionEvent];
        }
            break;
            
        default:
            break;
    }
}



- (void)onHttpReceivedData:(BaseActionEvent *)actionEvent withReponseObject:(id)responseObject
{
    BaseModelEvent *modelEvent = [[BaseModelEvent alloc] init];
    modelEvent.actionEvent = actionEvent;
    modelEvent.modelCode = MODEL_EVENT_CODE_SUCCESS_200;
    if (modelEvent.modelCode == MODEL_EVENT_CODE_SUCCESS || modelEvent.modelCode == MODEL_EVENT_CODE_SUCCESS_200)
    {
        switch (actionEvent.action)
        {
                
            case requestLogin:{
                NSDictionary *dictData = responseObject[@"error"];
                //
                int code = [dictData[@"code"] intValue];
                if(code == 0){
                    NSDictionary *dictData = responseObject[@"data"];
                    //
                    modelEvent.modelData = dictData;
                }
                else{
                    modelEvent.modelCode = code;
                    //
                    NSString *strMessage = nil;
                    NSDictionary *dictResponse = responseObject;
                    if(dictResponse[@"error"]){
                        if(dictResponse[@"error"][@"message"]){
                            strMessage = dictResponse[@"error"][@"message"];
                            //
                            modelEvent.modelData = strMessage;
                        }
                    }
                }
            }
                break;
        
                
            default:
                break;
        }
        
        [[AppController getController] receiveDataFromModel:modelEvent];
    }
    else
    {
        [[AppController getController] receiveErrorFromModel:modelEvent];
    }
}

- (void)onReceivedData:(BaseActionEvent *)actionEvent
{
    BaseModelEvent *modelEvent = [[BaseModelEvent alloc] init];
    modelEvent.actionEvent = actionEvent;
    modelEvent.modelCode = 200;
    switch (actionEvent.action)
    {
        default:
            break;
    }
    
    [[AppController getController] receiveDataFromModel:modelEvent];
}

- (void)onReceivedError:(BaseActionEvent *)actionEvent withError:(NSString *)error
{
    BaseModelEvent *modelEvent = [[BaseModelEvent alloc] init];
    modelEvent.actionEvent = actionEvent;
    modelEvent.modelCode = 201;
    modelEvent.modelMessage = error;
    [[AppController getController] receiveErrorFromModel:modelEvent];
}

@end
