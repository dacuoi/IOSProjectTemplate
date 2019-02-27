//
//  UserDTO.h
//  iosProjectTemplate
//
//  Created by tranquangson on 2/27/19.
//  Copyright © 2019 tranquangson. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserDTO : NSObject

@property (nonatomic, retain) NSString *userId;
@property (nonatomic, retain) NSString *token_API;
@property (nonatomic, retain) NSString *token_Sub;
@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSString *company;
@property (nonatomic, retain) NSString *phone;
@property (nonatomic, retain) NSString *email;
@property (nonatomic, retain) NSString *defaultProject;
@property (nonatomic, assign) BOOL status;
@property (nonatomic, assign) BOOL isChangePass;
@property (nonatomic, assign) int numProject;
@property (nonatomic, assign) BOOL isWelcome;

//Update Info with dictionary
- (void)updateInfo_login:(NSDictionary *)dictData;

@end
