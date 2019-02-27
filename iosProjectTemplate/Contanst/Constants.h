//
//  Constants.h
//  iosProjectTemplate
//
//  Created by tranquangson on 2/27/19.
//  Copyright © 2019 tranquangson. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Constants : NSObject

#define HTTP_REQUEST_PATH @"http://macaw-dev.ga:5002/v1"
//Code
#define MODEL_EVENT_CODE_SUCCESS_200  200
#define MODEL_EVENT_CODE_SUCCESS  0
#define MODEL_EVENT_CODE_FAILURE -1
// Method
#define API_REQUEST_LOGIN @"/login"

#define WHITE_COLOR [UIColor whiteColor]
#define BLUE_COLOR [UIColor colorWithRed:0.0f/255 green:128.0f/255 blue:255.0f/255 alpha:1.0]

#define HELVETICA_NEUE_REGULAR @"HelveticaNeue"
#define HELVETICA_NEUE_MEDIUM @"HelveticaNeue-Medium"
#define HELVETICA_NEUE_BOLD @"HelveticaNeue-Bold"
#define HELVETICA_NEUE_LIGHT @"HelveticaNeue-Light"

@end
