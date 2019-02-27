//
//  LoginViewController.h
//  iosProjectTemplate
//
//  Created by tranquangson on 2/27/19.
//  Copyright © 2019 tranquangson. All rights reserved.
//

#import "BaseViewController.h"

@interface LoginViewController : BaseViewController<UITextFieldDelegate>{
    UITextField *tfUserame;
    UITextField *tfPassword;
}

@end
