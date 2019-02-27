//
//  UserDTO.m
//  iosProjectTemplate
//
//  Created by tranquangson on 2/27/19.
//  Copyright © 2019 tranquangson. All rights reserved.
//

#import "UserDTO.h"

@implementation UserDTO

- (void)updateInfo_login:(NSDictionary *)dictData{
    if(dictData[@"tokenApi"]){
        _token_API = dictData[@"tokenApi"];
        _token_Sub = dictData[@"tokenSub"];
    }
    if(dictData[@"user"]){
        //
        if(dictData[@"user"][@"emails"]){
            NSArray *array = dictData[@"user"][@"emails"];
            if(array.count>0){
                _email = array[0][@"address"];
            }
        }
        if(dictData[@"user"][@"id"]){
            _userId = dictData[@"user"][@"id"];
        }
        if(dictData[@"user"][@"isWelcome"]){
            _isWelcome = dictData[@"user"][@"isWelcome"];
        }
        if(dictData[@"user"][@"defaultProject"] && [dictData[@"user"][@"defaultProject"] isKindOfClass:[NSNull class]] == NO){
            _defaultProject = dictData[@"user"][@"defaultProject"];
        }
        if(dictData[@"user"][@"name"]){
            _name = dictData[@"user"][@"name"];
        }
        if(dictData[@"user"][@"company"]){
            _company = dictData[@"user"][@"company"];
        }
        if(dictData[@"numberProject"]){
            _numProject = [dictData[@"numberProject"] intValue];
        }
        if(dictData[@"user"][@"services"]){
            if(dictData[@"user"][@"services"][@"password"]){
                _isChangePass = YES;
            }
        }
    }
}


@end
